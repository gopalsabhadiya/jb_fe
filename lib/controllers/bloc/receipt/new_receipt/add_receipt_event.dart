part of 'add_receipt_bloc.dart';

abstract class AddReceiptEvent extends Equatable {
  const AddReceiptEvent();
}

class AddNewReceipt extends AddReceiptEvent {
  final ReceiptPresentation receipt;

  const AddNewReceipt({required this.receipt});

  @override
  List<Object?> get props => [receipt];
}
