part of 'delete_party_bloc.dart';

abstract class DeletePartyEvent extends Equatable {
  const DeletePartyEvent();

  @override
  List<Object?> get props => [];
}

class DeleteParty extends DeletePartyEvent {
  final String partyIdToBeDeleted;

  const DeleteParty({required this.partyIdToBeDeleted});
}
