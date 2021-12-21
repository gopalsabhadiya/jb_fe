part of 'delete_party_bloc.dart';

enum DeletePartyStatus { LOADING, COMPLETED, ERROR }

class DeletePartyState extends Equatable {
  final DeletePartyStatus deleteStatus;
  final String? lastDeletedPartyId;

  const DeletePartyState({
    this.deleteStatus = DeletePartyStatus.COMPLETED,
    this.lastDeletedPartyId,
  });

  DeletePartyState copyWith({
    DeletePartyStatus? deleteStatus,
    String? lastDeletedPartyId,
  }) {
    return DeletePartyState(
      deleteStatus: deleteStatus ?? this.deleteStatus,
      lastDeletedPartyId: lastDeletedPartyId ?? this.lastDeletedPartyId,
    );
  }

  @override
  List<Object> get props => [deleteStatus];
}
