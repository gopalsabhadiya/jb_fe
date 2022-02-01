part of 'add_receipt_bloc.dart';

enum AddReceiptStatus { LOADING, COMPLETED, BUILDING, ERROR }

class AddReceiptState extends Equatable {
  final AddReceiptStatus status;
  final PartyPresentation? party;
  final List<OrderPresentation>? unpaidOrderList;
  final ReceiptPresentation receipt;

  const AddReceiptState({
    this.status = AddReceiptStatus.BUILDING,
    required this.receipt,
    this.party,
    this.unpaidOrderList,
  });

  AddReceiptState copyWith({
    AddReceiptStatus? status,
    PartyPresentation? party,
    ReceiptPresentation? receipt,
    List<OrderPresentation>? unpaidOrderList,
  }) {
    return AddReceiptState(
      status: status ?? this.status,
      party: party ?? this.party,
      receipt: receipt ?? this.receipt,
      unpaidOrderList: unpaidOrderList ?? this.unpaidOrderList,
    );
  }

  @override
  List<Object?> get props => [status, party, receipt];
}
