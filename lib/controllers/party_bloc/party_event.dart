part of 'party_bloc.dart';

abstract class PartyEvent extends Equatable {
  const PartyEvent();

  @override
  List<Object?> get props => [];
}

class FetchParties extends PartyEvent {}

class SearchPartyDisplay extends PartyEvent {
  final List<PartyPresentation> searchResult;
  final String searchTerm;

  const SearchPartyDisplay(
      {required this.searchResult, required this.searchTerm});
}

class ClearSearchTerm extends PartyEvent {}

class RemoveParty extends PartyEvent {
  final String partyId;

  const RemoveParty({required this.partyId});
}
