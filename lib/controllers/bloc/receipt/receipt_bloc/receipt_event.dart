part of 'receipt_bloc.dart';

abstract class ReceiptEvent extends Equatable {
  const ReceiptEvent();

  @override
  List<Object?> get props => [];
}

class FetchReceiptFirstPage extends ReceiptEvent {}

class FetchNextReceiptPage extends ReceiptEvent {}

class SearchReceiptDisplay extends ReceiptEvent {
  final List<ReceiptPresentation> searchResult;
  final String searchTerm;

  const SearchReceiptDisplay({
    required this.searchResult,
    required this.searchTerm,
  });

  @override
  List<Object?> get props => [searchResult, searchTerm];
}
