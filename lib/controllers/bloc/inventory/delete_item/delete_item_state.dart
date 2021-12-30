part of 'delete_item_bloc.dart';

enum DeleteItemStatus { LOADING, COMPLETED, ERROR }

class DeleteItemState extends Equatable {
  final DeleteItemStatus deleteStatus;
  final String? lastDeletedItemId;

  const DeleteItemState(
      {this.deleteStatus = DeleteItemStatus.COMPLETED, this.lastDeletedItemId});

  DeleteItemState copyWith({
    DeleteItemStatus? deleteStatus,
    String? lastDeletedItemId,
  }) {
    return DeleteItemState(
      deleteStatus: deleteStatus ?? this.deleteStatus,
      lastDeletedItemId: lastDeletedItemId ?? this.lastDeletedItemId,
    );
  }

  @override
  List<Object?> get props => [deleteStatus, lastDeletedItemId];
}
