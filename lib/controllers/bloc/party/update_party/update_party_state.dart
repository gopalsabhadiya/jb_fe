part of 'update_party_bloc.dart';

enum UpdatePartyStatus { LOADING, COMPLETED, ERROR }

class UpdatePartyState extends Equatable {
  final UpdatePartyStatus status;
  final PartyPresentation? partyToBeUpdated;

  const UpdatePartyState({
    this.status = UpdatePartyStatus.COMPLETED,
    this.partyToBeUpdated,
  });

  UpdatePartyState copyWith({
    UpdatePartyStatus? status,
    PartyPresentation? partyToBeUpdated,
  }) {
    return UpdatePartyState(
      status: status ?? this.status,
      partyToBeUpdated: partyToBeUpdated ?? this.partyToBeUpdated,
    );
  }

  @override
  List<Object?> get props => [status, partyToBeUpdated];
}
