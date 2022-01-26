part of 'delete_receipt_bloc.dart';

enum DeleteReceiptStatus { LOADING, COMPLETED, ERROR }

class DeleteReceiptState extends Equatable {
  final DeleteReceiptStatus deleteStatus;
  final String? lastDeletedReceiptId;

  const DeleteReceiptState({
    this.deleteStatus = DeleteReceiptStatus.COMPLETED,
    this.lastDeletedReceiptId,
  });

  DeleteReceiptState copyWith({
    DeleteReceiptStatus? deleteStatus,
    String? lastDeletedReceiptId,
  }) {
    return DeleteReceiptState(
      deleteStatus: deleteStatus ?? this.deleteStatus,
      lastDeletedReceiptId: lastDeletedReceiptId ?? this.lastDeletedReceiptId,
    );
  }

  @override
  List<Object?> get props => [deleteStatus, lastDeletedReceiptId];
}
