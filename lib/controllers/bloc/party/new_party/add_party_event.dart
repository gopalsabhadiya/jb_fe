part of 'add_party_bloc.dart';

abstract class AddPartyEvent extends Equatable {
  const AddPartyEvent();
}

class AddNewParty extends AddPartyEvent {
  final PartyPresentation party;

  const AddNewParty({required this.party});

  @override
  List<Object?> get props => [party];
}
