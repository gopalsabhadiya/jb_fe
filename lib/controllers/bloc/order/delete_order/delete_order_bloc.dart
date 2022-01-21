import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jb_fe/backend_integration/domain/usecase/order/delete_order.dart';
import 'package:jb_fe/controllers/bloc/order/mediator/notification/notification.dart';
import 'package:jb_fe/controllers/bloc/order/mediator/notifier/delete_notifier.dart';

part 'delete_order_event.dart';
part 'delete_order_state.dart';

class DeleteOrderBloc extends Bloc<DeleteOrderEvent, DeleteOrderState>
    with DeleteOrderNotifier {
  final DeleteOrderUseCase deleteOrderUseCase;

  DeleteOrderBloc({required this.deleteOrderUseCase})
      : super(const DeleteOrderState()) {
    on<DeleteOrder>(_onDeleteOrder);
  }

  FutureOr<void> _onDeleteOrder(
      DeleteOrder event, Emitter<DeleteOrderState> emit) async {
    emit(
      state.copyWith(
        deleteStatus: DeleteOrderStatus.LOADING,
        lastDeletedOrderId: event.orderIdToBeDeleted,
      ),
    );
    try {
      await deleteOrderUseCase(orderId: event.orderIdToBeDeleted);
      emit(
        state.copyWith(
          deleteStatus: DeleteOrderStatus.COMPLETED,
        ),
      );
      notifySubscriber(
        notification: DeleteOrderNotification(
          orderId: event.orderIdToBeDeleted,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          deleteStatus: DeleteOrderStatus.ERROR,
        ),
      );
      return null;
    }
  }
}
