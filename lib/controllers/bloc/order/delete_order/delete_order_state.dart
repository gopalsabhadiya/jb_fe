part of 'delete_order_bloc.dart';

enum DeleteOrderStatus { LOADING, COMPLETED, ERROR }

class DeleteOrderState extends Equatable {
  final DeleteOrderStatus deleteStatus;
  final String? lastDeletedOrderId;

  const DeleteOrderState({
    this.deleteStatus = DeleteOrderStatus.COMPLETED,
    this.lastDeletedOrderId,
  });

  DeleteOrderState copyWith({
    DeleteOrderStatus? deleteStatus,
    String? lastDeletedOrderId,
  }) {
    return DeleteOrderState(
      deleteStatus: deleteStatus ?? this.deleteStatus,
      lastDeletedOrderId: lastDeletedOrderId ?? this.lastDeletedOrderId,
    );
  }

  @override
  List<Object?> get props => [deleteStatus, lastDeletedOrderId];
}
