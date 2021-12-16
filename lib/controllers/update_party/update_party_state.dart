part of 'update_party_bloc.dart';

enum UpdatePartyStatus { LOADING, COMPLETED, ERROR }

class UpdatePartyState extends Equatable {
  final UpdatePartyStatus updateStatus;

  const UpdatePartyState({this.updateStatus = UpdatePartyStatus.COMPLETED});

  @override
  List<Object> get props => [updateStatus];
}
