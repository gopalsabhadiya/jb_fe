part of 'new_party_bloc.dart';

enum NewPartyStatus { LOADING, COMPLETED, ERROR }

class NewPartyState extends Equatable {
  final NewPartyStatus status;

  const NewPartyState({this.status = NewPartyStatus.COMPLETED});

  @override
  List<Object> get props => [status];
}
