part of 'party_bloc.dart';

abstract class PartyEvent extends Equatable {
  const PartyEvent();

  @override
  List<Object?> get props => [];
}

class FetchParties extends PartyEvent {}

class RemoveParty extends PartyEvent {
  final String partyId;

  const RemoveParty({required this.partyId});
}
