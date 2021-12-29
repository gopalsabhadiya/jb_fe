part of 'add_party_bloc.dart';

abstract class AddPartyEvent extends Equatable {
  const AddPartyEvent();

  @override
  List<Object?> get props => [];
}

class AddNewParty extends AddPartyEvent {
  final PartyPresentation partyPresentation;

  const AddNewParty({required this.partyPresentation});
}
