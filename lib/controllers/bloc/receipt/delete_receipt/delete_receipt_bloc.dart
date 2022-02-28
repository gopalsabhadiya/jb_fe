import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jb_fe/backend_integration/domain/usecase/payment/delete_receipt.dart';
import 'package:jb_fe/controllers/bloc/receipt/mediator/notification/notification.dart';
import 'package:jb_fe/controllers/bloc/receipt/mediator/notifier/delete_notifier.dart';
import 'package:jb_fe/util/extension/common_logging.dart';

import '../../../../util/logger.dart';

part 'delete_receipt_event.dart';
part 'delete_receipt_state.dart';

class DeleteReceiptBloc extends Bloc<DeleteReceiptEvent, DeleteReceiptState>
    with DeleteReceiptNotifier {
  final log = getLogger<DeleteReceiptBloc>();

  final DeleteReceiptUseCase deleteReceiptUseCase;

  DeleteReceiptBloc({required this.deleteReceiptUseCase})
      : super(const DeleteReceiptState()) {
    on<DeleteReceipt>(_onDeleteReceipt);
  }

  FutureOr<void> _onDeleteReceipt(
      DeleteReceipt event, Emitter<DeleteReceiptState> emit) async {
    log.logEvent<DeleteReceipt>();

    emit(
      state.copyWith(
        deleteStatus: DeleteReceiptStatus.LOADING,
        lastDeletedReceiptId: event.receiptIdToBeDeleted,
      ),
    );
    try {
      await deleteReceiptUseCase(receiptId: event.receiptIdToBeDeleted);
      emit(
        state.copyWith(
          deleteStatus: DeleteReceiptStatus.COMPLETED,
        ),
      );
      notifySubscriber(
        notification: DeleteReceiptNotification(
          receiptId: event.receiptIdToBeDeleted,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          deleteStatus: DeleteReceiptStatus.ERROR,
        ),
      );
      return null;
    }
  }
}
