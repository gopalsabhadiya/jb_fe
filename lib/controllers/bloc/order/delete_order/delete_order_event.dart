part of 'delete_order_bloc.dart';

abstract class DeleteOrderEvent extends Equatable {
  const DeleteOrderEvent();
}

class DeleteOrder extends DeleteOrderEvent {
  final String orderIdToBeDeleted;

  const DeleteOrder({required this.orderIdToBeDeleted});

  @override
  List<Object?> get props => [orderIdToBeDeleted];
}
