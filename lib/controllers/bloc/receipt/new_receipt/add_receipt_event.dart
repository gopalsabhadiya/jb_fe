part of 'add_receipt_bloc.dart';

abstract class AddReceiptEvent extends Equatable {
  const AddReceiptEvent();
}

class AddPartyToReceipt extends AddReceiptEvent {
  final PartyPresentation party;

  const AddPartyToReceipt({required this.party});

  @override
  List<Object?> get props => [party];
}

class AddPaymentToReceipt extends AddReceiptEvent {
  final OrderPresentation order;
  final double amount;

  const AddPaymentToReceipt({required this.order, required this.amount});

  @override
  List<Object?> get props => [order, amount];
}

class SaveReceipt extends AddReceiptEvent {
  @override
  List<Object?> get props => [];
}
