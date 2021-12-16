part of 'delete_party_bloc.dart';

enum DeletePartyStatus { LOADING, COMPLETED, ERROR }

class DeletePartyState extends Equatable {
  final DeletePartyStatus deleteStatus;
  final String? lastDeletedPartyId;

  const DeletePartyState({
    this.deleteStatus = DeletePartyStatus.COMPLETED,
    this.lastDeletedPartyId,
  });

  @override
  List<Object> get props => [deleteStatus];
}
