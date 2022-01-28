part of 'fetch_receipt_bloc.dart';

enum FetchReceiptStatus { LOADING, COMPLETED, ERROR }

class FetchReceiptState extends Equatable {
  final FetchReceiptStatus status;
  final ReceiptPresentation? receipt;
  final PartyPresentation? party;
  final List<OrderPresentation>? orders;

  const FetchReceiptState({
    this.status = FetchReceiptStatus.LOADING,
    this.receipt,
    this.party,
    this.orders,
  });

  FetchReceiptState copyWith({
    FetchReceiptStatus? status,
    ReceiptPresentation? receipt,
    PartyPresentation? party,
    List<OrderPresentation>? orders,
  }) {
    return FetchReceiptState(
      status: status ?? this.status,
      receipt: receipt ?? this.receipt,
      party: party ?? this.party,
      orders: orders ?? this.orders,
    );
  }

  @override
  List<Object?> get props => [status, receipt, party, orders];
}
