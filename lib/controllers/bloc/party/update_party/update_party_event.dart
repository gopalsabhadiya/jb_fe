part of 'update_party_bloc.dart';

abstract class UpdatePartyEvent extends Equatable {
  const UpdatePartyEvent();

  @override
  List<Object?> get props => [];
}

class UpdateParty extends UpdatePartyEvent {
  final PartyPresentation partyPresentation;

  const UpdateParty({required this.partyPresentation});
}
