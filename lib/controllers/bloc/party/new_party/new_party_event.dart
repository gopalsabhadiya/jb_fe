part of 'new_party_bloc.dart';

abstract class NewPartyEvent extends Equatable {
  const NewPartyEvent();

  @override
  List<Object?> get props => [];
}

class NewParty extends NewPartyEvent {
  final PartyPresentation partyPresentation;

  const NewParty({required this.partyPresentation});
}
