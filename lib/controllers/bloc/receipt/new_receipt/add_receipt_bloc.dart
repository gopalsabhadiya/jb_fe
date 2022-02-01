import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jb_fe/backend_integration/domain/usecase/order/fetch_unpaid_orders.dart';
import 'package:jb_fe/backend_integration/domain/usecase/payment/create_receipt.dart';
import 'package:jb_fe/backend_integration/dto/order/order_presentation.dart';
import 'package:jb_fe/backend_integration/dto/party/party_presentation.dart';
import 'package:jb_fe/backend_integration/dto/payment/receipt_presentation.dart';
import 'package:jb_fe/controllers/bloc/receipt/mediator/notification/notification.dart';
import 'package:jb_fe/controllers/bloc/receipt/mediator/notifier/add_notifier.dart';
import 'package:url_launcher/url_launcher.dart';

part 'add_receipt_event.dart';
part 'add_receipt_state.dart';

class AddReceiptBloc extends Bloc<AddReceiptEvent, AddReceiptState>
    with AddReceiptNotifier {
  final CreateReceiptUseCase createReceiptUseCase;
  final FetchUnpaidOrdersUseCase fetchUnpaidOrdersUseCase;

  AddReceiptBloc(
      {required this.createReceiptUseCase,
      required this.fetchUnpaidOrdersUseCase})
      : super(
          AddReceiptState(
            receipt: ReceiptPresentation.empty(),
          ),
        ) {
    on<AddPartyToReceipt>(_addPartyToReceipt);
    on<SaveReceipt>(_saveReceipt);
    on<AddPaymentToReceipt>(_addPaymentToReceipt);
  }

  FutureOr<void> _addPartyToReceipt(
      AddPartyToReceipt event, Emitter<AddReceiptState> emit) async {
    emit(
      state.copyWith(
        status: AddReceiptStatus.LOADING,
      ),
    );
    ReceiptPresentation receipt = state.receipt;
    receipt.setParty(event.party.id!);
    final List<OrderPresentation> orderList =
        await fetchUnpaidOrdersUseCase(partyId: event.party.id!);
    emit(
      state.copyWith(
        party: event.party,
        receipt: receipt,
        status: AddReceiptStatus.BUILDING,
        unpaidOrderList: orderList,
      ),
    );
  }

  FutureOr<void> _saveReceipt(
      SaveReceipt event, Emitter<AddReceiptState> emit) async {
    emit(
      state.copyWith(
        status: AddReceiptStatus.LOADING,
      ),
    );
    state.receipt.updateActiveAmmount();
    ReceiptPresentation receiptPresentation =
        await createReceiptUseCase(receipt: state.receipt);
    print('Order placed: ${state.party}');
    await Future.delayed(const Duration(seconds: 2));

    notifySubscriber(
      notification: NewReceiptNotification(
        receipt: receiptPresentation.getReceiptDetailsPresentation(
          party: state.party!,
        ),
      ),
    );
    launch("http://localhost:8080/api/bill/${receiptPresentation.id}");
    // FutureOr<Uint8List> pdf =
    //     await Printing.convertHtml(html: state.order.toString());
    // Printing.sharePdf(
    //     bytes: Uint8List.fromList(state.order.toString().codeUnits));
    // await Future.delayed(const Duration(seconds: 2));
    // await Printing.layoutPdf(
    //     onLayout: Uint8List.fromList(state.order.toString()));
    // print("PDF: $pdf");
    ReceiptPresentation newReceipt = ReceiptPresentation.empty();
    // newOrder.setGoldRate(state.order.goldRate.toString());
    emit(
      state.copyWith(
        status: AddReceiptStatus.COMPLETED,
        receipt: newReceipt,
        party: null,
      ),
    );
  }

  FutureOr<void> _addPaymentToReceipt(
      AddPaymentToReceipt event, Emitter<AddReceiptState> emit) {
    final ReceiptPresentation receipt = state.receipt;
    receipt.addPayment(
      amount: event.amount,
      orderId: event.order.id!,
    );

    emit(
      state.copyWith(
        receipt: receipt,
      ),
    );
  }
}
