part of 'search_party_bloc.dart';

enum SearchPartyStatus { LOADING, COMPLETED, ERROR }

class SearchPartyState extends Equatable {
  final SearchPartyStatus searchStatus;
  final String searchTerm;
  final List<PartyPresentation> result;

  const SearchPartyState({
    this.searchStatus = SearchPartyStatus.COMPLETED,
    this.searchTerm = "",
    this.result = const <PartyPresentation>[],
  });

  SearchPartyState copyWith({
    SearchPartyStatus? searchStatus,
    String? searchTerm,
    List<PartyPresentation>? result,
  }) {
    return SearchPartyState(
      searchStatus: searchStatus ?? this.searchStatus,
      searchTerm: searchTerm ?? this.searchTerm,
      result: result ?? this.result,
    );
  }

  @override
  List<Object> get props => [searchStatus, result, searchTerm];
}
