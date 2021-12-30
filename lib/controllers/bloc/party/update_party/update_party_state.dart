part of 'update_party_bloc.dart';

enum UpdatePartyStatus { LOADING, COMPLETED, ERROR }

class UpdatePartyState extends Equatable {
  final UpdatePartyStatus updateStatus;
  final PartyPresentation? partyToBeUpdated;

  const UpdatePartyState({
    this.updateStatus = UpdatePartyStatus.COMPLETED,
    this.partyToBeUpdated,
  });

  UpdatePartyState copyWith({
    UpdatePartyStatus? updateStatus,
    PartyPresentation? partyToBeUpdated,
  }) {
    return UpdatePartyState(
      updateStatus: updateStatus ?? this.updateStatus,
      partyToBeUpdated: partyToBeUpdated ?? this.partyToBeUpdated,
    );
  }

  @override
  List<Object?> get props => [updateStatus, partyToBeUpdated];
}
