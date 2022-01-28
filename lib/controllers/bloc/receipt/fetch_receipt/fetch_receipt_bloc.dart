import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jb_fe/backend_integration/domain/usecase/order/fetch_batch_order.dart';
import 'package:jb_fe/backend_integration/domain/usecase/party/fetch_party.dart';
import 'package:jb_fe/backend_integration/domain/usecase/payment/fetch_receipt.dart';
import 'package:jb_fe/backend_integration/dto/order/order_presentation.dart';
import 'package:jb_fe/backend_integration/dto/party/party_presentation.dart';
import 'package:jb_fe/backend_integration/dto/payment/receipt_presentation.dart';

part 'fetch_receipt_event.dart';
part 'fetch_receipt_state.dart';

class FetchReceiptBloc extends Bloc<FetchReceiptEvent, FetchReceiptState> {
  final FetchReceiptUseCase fetchReceiptUseCase;
  final FetchPartyUseCase fetchPartyUseCase;
  final FetchOrderBatchUseCase fetchOrderBatchUseCase;

  FetchReceiptBloc({
    required this.fetchReceiptUseCase,
    required this.fetchPartyUseCase,
    required this.fetchOrderBatchUseCase,
  }) : super(const FetchReceiptState()) {
    on<FetchReceipt>(_onFetchReceipt);
  }

  FutureOr<void> _onFetchReceipt(
      FetchReceipt event, Emitter<FetchReceiptState> emit) async {
    emit(
      state.copyWith(
        status: FetchReceiptStatus.LOADING,
      ),
    );

    try {
      final receipt =
          await fetchReceiptUseCase(receiptId: event.receiptIdToBeFetched);

      final party = await fetchPartyUseCase(partyId: receipt.party);

      final orders = await fetchOrderBatchUseCase(
        orderIdList: receipt.payments.map((e) => e.orderId).toList(),
      );

      print("PartyPesentation: $party");
      emit(
        state.copyWith(
          status: FetchReceiptStatus.COMPLETED,
          receipt: receipt,
          party: party,
          orders: orders,
        ),
      );
    } catch (e) {
      print("Error in fetch receipt bloc: $e");
      emit(
        state.copyWith(
          status: FetchReceiptStatus.ERROR,
        ),
      );
    }
  }
}
