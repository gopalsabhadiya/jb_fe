part of 'update_order_bloc.dart';

abstract class UpdateOrderEvent extends Equatable {
  const UpdateOrderEvent();
}

class UpdateOrder extends UpdateOrderEvent {
  final OrderPresentation order;

  const UpdateOrder({required this.order});

  @override
  List<Object?> get props => [order];
}
