part of 'fetch_receipt_bloc.dart';

abstract class FetchReceiptEvent extends Equatable {
  const FetchReceiptEvent();
}

class FetchReceipt extends FetchReceiptEvent {
  final String receiptIdToBeFetched;

  const FetchReceipt({required this.receiptIdToBeFetched});

  @override
  List<Object?> get props => [receiptIdToBeFetched];
}
