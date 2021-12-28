part of 'update_party_bloc.dart';

abstract class UpdatePartyEvent extends Equatable {
  const UpdatePartyEvent();

  @override
  List<Object?> get props => [];
}

class AddPartyToBeUpdated extends UpdatePartyEvent {
  final PartyPresentation partyToBeUpdated;

  const AddPartyToBeUpdated({required this.partyToBeUpdated});
}

class RemovePartyToBeUpdated extends UpdatePartyEvent {}

class UpdateParty extends UpdatePartyEvent {
  final PartyPresentation partyPresentation;

  const UpdateParty({required this.partyPresentation});
}
