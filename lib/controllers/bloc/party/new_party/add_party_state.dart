part of 'add_party_bloc.dart';

enum AddPartyStatus { LOADING, COMPLETED, ERROR }

class AddPartyState extends Equatable {
  final AddPartyStatus status;

  const AddPartyState({this.status = AddPartyStatus.COMPLETED});

  @override
  List<Object> get props => [status];
}
