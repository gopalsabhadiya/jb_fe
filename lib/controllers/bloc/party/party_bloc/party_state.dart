part of 'party_bloc.dart';

enum PartyStatus { INITIAL, LOADING, SUCCESS, FAILURE }

class PartyState extends Equatable {
  final PartyStatus status;
  final List<PartyPresentation> partyList;
  final bool hasReachedMax;
  final bool needToSearch;

  const PartyState({
    this.status = PartyStatus.INITIAL,
    this.partyList = const <PartyPresentation>[],
    this.hasReachedMax = false,
    this.needToSearch = false,
  });

  PartyState copyWith({
    PartyStatus? status,
    List<PartyPresentation>? partyList,
    bool? hasReachedMax,
    bool? needToSearch,
  }) {
    return PartyState(
        status: status ?? this.status,
        partyList: partyList ?? this.partyList,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax,
        needToSearch: needToSearch ?? this.needToSearch);
  }

  @override
  List<Object?> get props => [status, partyList, hasReachedMax, needToSearch];
}
