part of 'add_receipt_bloc.dart';

enum AddReceiptStatus { LOADING, COMPLETED, BUILDING, ERROR }

class AddReceiptState extends Equatable {
  final AddReceiptStatus status;
  final PartyPresentation? party;
  final ReceiptPresentation receipt;

  const AddReceiptState({
    this.status = AddReceiptStatus.COMPLETED,
    required this.receipt,
    this.party,
  });

  AddReceiptState copyWith({
    AddReceiptStatus? status,
    PartyPresentation? party,
    ReceiptPresentation? receipt,
  }) {
    return AddReceiptState(
      status: status ?? this.status,
      party: party ?? this.party,
      receipt: receipt ?? this.receipt,
    );
  }

  @override
  List<Object?> get props => [status, party, receipt];
}
