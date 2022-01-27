part of 'search_receipt_bloc.dart';

enum SearchReceiptStatus { LOADING, COMPLETED, ERROR }

class SearchReceiptState extends Equatable {
  final SearchReceiptStatus searchStatus;
  final String searchTerm;
  final List<ReceiptDetailsPresentation> result;

  const SearchReceiptState({
    this.searchStatus = SearchReceiptStatus.COMPLETED,
    this.searchTerm = DefaultTexts.EMPTY,
    this.result = const <ReceiptDetailsPresentation>[],
  });

  SearchReceiptState copyWith({
    SearchReceiptStatus? searchStatus,
    String? searchTerm,
    List<ReceiptDetailsPresentation>? result,
  }) {
    return SearchReceiptState(
      searchStatus: searchStatus ?? this.searchStatus,
      searchTerm: searchTerm ?? this.searchTerm,
      result: result ?? this.result,
    );
  }

  @override
  List<Object> get props => [searchStatus, result, searchTerm];
}
