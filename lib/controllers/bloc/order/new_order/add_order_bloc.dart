import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jb_fe/backend_integration/domain/usecase/order/create_order.dart';
import 'package:jb_fe/backend_integration/dto/order/order_presentation.dart';
import 'package:jb_fe/controllers/bloc/order/mediator/notification/notification.dart';
import 'package:jb_fe/controllers/bloc/order/mediator/notifier/add_notifier.dart';

part 'add_order_event.dart';
part 'add_order_state.dart';

class AddOrderBloc extends Bloc<AddOrderEvent, AddOrderState>
    with AddOrderNotifier {
  final CreateOrderUseCase createOrderUseCase;

  AddOrderBloc({required this.createOrderUseCase})
      : super(const AddOrderState()) {
    on<AddNewOrder>(_onAddNewOrder);
  }

  FutureOr<void> _onAddNewOrder(
      AddNewOrder event, Emitter<AddOrderState> emit) async {
    emit(const AddOrderState(status: AddOrderStatus.LOADING));
    try {
      final savedOrder = await createOrderUseCase(order: event.order);
      await Future.delayed(const Duration(seconds: 1));
      emit(const AddOrderState(status: AddOrderStatus.COMPLETED));
      notifySubscriber(
        notification: NewOrderNotification(
          order: savedOrder,
        ),
      );
    } catch (e) {
      print("Error caught: $e");
      emit(const AddOrderState(status: AddOrderStatus.ERROR));
      return null;
    }
  }
}
