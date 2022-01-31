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

class SaveReceipt extends AddReceiptEvent {
  @override
  List<Object?> get props => [];
}
