import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jb_fe/backend_integration/domain/usecase/order/update_order.dart';
import 'package:jb_fe/backend_integration/dto/order/order_presentation.dart';
import 'package:jb_fe/controllers/bloc/order/mediator/notification/notification.dart';
import 'package:jb_fe/controllers/bloc/order/mediator/notifier/update_notifier.dart';

part 'update_order_event.dart';
part 'update_order_state.dart';

class UpdateOrderBloc extends Bloc<UpdateOrderEvent, UpdateOrderState>
    with UpdateOrderNotifier {
  final UpdateOrderUseCase updateOrderUseCase;

  UpdateOrderBloc({required this.updateOrderUseCase})
      : super(const UpdateOrderState()) {
    on<UpdateOrder>(_onUpdateOrder);
  }

  FutureOr<void> _onUpdateOrder(
      UpdateOrder event, Emitter<UpdateOrderState> emit) async {
    emit(
      const UpdateOrderState(
        status: UpdateOrderStatus.LOADING,
      ),
    );
    try {
      await updateOrderUseCase(order: event.order);
      emit(
        const UpdateOrderState(
          status: UpdateOrderStatus.COMPLETED,
        ),
      );
      notifySubscriber(
        notification: UpdateOrderNotification(
          order: event.order,
        ),
      );
    } catch (e) {
      emit(
        const UpdateOrderState(
          status: UpdateOrderStatus.ERROR,
        ),
      );
      return null;
    }
  }
}
