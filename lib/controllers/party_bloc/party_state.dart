part of 'party_bloc.dart';

enum PartyStatus { initial, success, failure }

class PartyState extends Equatable {
  final PartyStatus status;
  final List<PartyPresentation> partyList;
  final bool hasReachedMax;

  const PartyState({
    this.status = PartyStatus.initial,
    this.partyList = const <PartyPresentation>[],
    this.hasReachedMax = false,
  });

  PartyState copyWith({
    PartyStatus? status,
    List<PartyPresentation>? partyList,
    bool? hasReachedMax,
  }) {
    return PartyState(
      status: status ?? this.status,
      partyList: partyList ?? this.partyList,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object?> get props => [status, partyList, hasReachedMax];
}
