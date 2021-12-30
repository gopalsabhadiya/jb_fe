part of 'search_item_bloc.dart';

enum SearchItemStatus { LOADING, COMPLETED, ERROR }

class SearchItemState extends Equatable {
  final SearchItemStatus searchStatus;
  final String searchTerm;
  final List<ItemPresentation> result;

  const SearchItemState({
    this.searchStatus = SearchItemStatus.COMPLETED,
    this.searchTerm = DefaultTexts.EMPTY,
    this.result = const <ItemPresentation>[],
  });

  SearchItemState copyWith({
    SearchItemStatus? searchStatus,
    String? searchTerm,
    List<ItemPresentation>? result,
  }) {
    return SearchItemState(
      searchStatus: searchStatus ?? this.searchStatus,
      searchTerm: searchTerm ?? this.searchTerm,
      result: result ?? this.result,
    );
  }

  @override
  List<Object?> get props => [searchStatus, searchTerm, result];
}
