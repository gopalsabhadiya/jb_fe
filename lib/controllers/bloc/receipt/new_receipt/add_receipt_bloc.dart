import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jb_fe/backend_integration/domain/usecase/payment/create_receipt.dart';
import 'package:jb_fe/backend_integration/dto/payment/receipt_presentation.dart';
import 'package:jb_fe/controllers/bloc/receipt/mediator/notification/notification.dart';
import 'package:jb_fe/controllers/bloc/receipt/mediator/notifier/add_notifier.dart';

part 'add_receipt_event.dart';
part 'add_receipt_state.dart';

class AddReceiptBloc extends Bloc<AddReceiptEvent, AddReceiptState>
    with AddReceiptNotifier {
  final CreateReceiptUseCase createReceiptUseCase;

  AddReceiptBloc({required this.createReceiptUseCase})
      : super(const AddReceiptState()) {
    on<AddNewReceipt>(_onAddNewReceipt);
  }

  FutureOr<void> _onAddNewReceipt(
      AddNewReceipt event, Emitter<AddReceiptState> emit) async {
    emit(const AddReceiptState(status: AddReceiptStatus.LOADING));
    try {
      final savedReceipt = await createReceiptUseCase(receipt: event.receipt);
      await Future.delayed(const Duration(seconds: 1));
      emit(const AddReceiptState(status: AddReceiptStatus.COMPLETED));
      notifySubscriber(
        notification: NewReceiptNotification(
          receipt: savedReceipt,
        ),
      );
    } catch (e) {
      print("Error caught: $e");
      emit(const AddReceiptState(status: AddReceiptStatus.ERROR));
      return null;
    }
  }
}
