part of 'update_party_bloc.dart';

abstract class UpdatePartyEvent extends Equatable {
  const UpdatePartyEvent();
}

class UpdateParty extends UpdatePartyEvent {
  final PartyPresentation party;

  const UpdateParty({required this.party});

  @override
  List<Object?> get props => [party];
}
