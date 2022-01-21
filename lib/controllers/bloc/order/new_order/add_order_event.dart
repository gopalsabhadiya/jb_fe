part of 'add_order_bloc.dart';

abstract class AddOrderEvent extends Equatable {
  const AddOrderEvent();
}

class AddNewOrder extends AddOrderEvent {
  final OrderPresentation order;

  const AddNewOrder({required this.order});

  @override
  List<Object?> get props => [order];
}
