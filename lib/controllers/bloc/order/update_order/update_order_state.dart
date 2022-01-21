part of 'update_order_bloc.dart';

enum UpdateOrderStatus { LOADING, COMPLETED, ERROR }

class UpdateOrderState extends Equatable {
  final UpdateOrderStatus status;
  final OrderPresentation? orderToBeUpdated;

  const UpdateOrderState({
    this.status = UpdateOrderStatus.COMPLETED,
    this.orderToBeUpdated,
  });

  UpdateOrderState copyWith({
    UpdateOrderStatus? status,
    OrderPresentation? orderToBeUpdated,
  }) {
    return UpdateOrderState(
      status: status ?? this.status,
      orderToBeUpdated: orderToBeUpdated ?? this.orderToBeUpdated,
    );
  }

  @override
  List<Object?> get props => [status, orderToBeUpdated];
}
