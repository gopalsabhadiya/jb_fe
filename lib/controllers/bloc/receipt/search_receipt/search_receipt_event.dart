part of 'search_receipt_bloc.dart';

abstract class SearchReceiptEvent extends Equatable {
  const SearchReceiptEvent();
}

class SearchReceipt extends SearchReceiptEvent {
  final String searchTerm;

  const SearchReceipt({required this.searchTerm});

  @override
  List<Object?> get props => [searchTerm];
}

class ClearSearchReceiptTerm extends SearchReceiptEvent {
  @override
  List<Object?> get props => [];
}
