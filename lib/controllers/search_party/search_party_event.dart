part of 'search_party_bloc.dart';

abstract class SearchPartyEvent extends Equatable {
  const SearchPartyEvent();

  @override
  List<Object?> get props => [];
}

class SearchParty extends SearchPartyEvent {
  final String searchTerm;

  const SearchParty({required this.searchTerm});
}
