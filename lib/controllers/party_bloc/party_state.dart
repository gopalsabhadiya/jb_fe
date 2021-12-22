part of 'party_bloc.dart';

enum PartyStatus { initial, success, failure }

class PartyState extends Equatable {
  final PartyStatus status;
  final List<PartyPresentation> partyList;
  final bool hasReachedMax;
  final String searchTerm;

  const PartyState({
    this.status = PartyStatus.initial,
    this.partyList = const <PartyPresentation>[],
    this.hasReachedMax = false,
    this.searchTerm = "",
  });

  PartyState copyWith({
    PartyStatus? status,
    List<PartyPresentation>? partyList,
    bool? hasReachedMax,
    String? searchTerm,
  }) {
    return PartyState(
        status: status ?? this.status,
        partyList: partyList ?? this.partyList,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax,
        searchTerm: searchTerm ?? this.searchTerm);
  }

  @override
  List<Object?> get props => [status, partyList, hasReachedMax];
}
