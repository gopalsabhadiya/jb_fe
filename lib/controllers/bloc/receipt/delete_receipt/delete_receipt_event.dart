part of 'delete_receipt_bloc.dart';

abstract class DeleteReceiptEvent extends Equatable {
  const DeleteReceiptEvent();
}

class DeleteReceipt extends DeleteReceiptEvent {
  final String receiptIdToBeDeleted;

  const DeleteReceipt({required this.receiptIdToBeDeleted});

  @override
  List<Object?> get props => [receiptIdToBeDeleted];
}
