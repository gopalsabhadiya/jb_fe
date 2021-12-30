part of 'search_party_bloc.dart';

abstract class SearchPartyEvent extends Equatable {
  const SearchPartyEvent();
}

class SearchParty extends SearchPartyEvent {
  final String searchTerm;

  const SearchParty({required this.searchTerm});

  @override
  List<Object?> get props => [searchTerm];
}

class ClearSearchPartyTerm extends SearchPartyEvent {
  @override
  List<Object?> get props => [];
}
