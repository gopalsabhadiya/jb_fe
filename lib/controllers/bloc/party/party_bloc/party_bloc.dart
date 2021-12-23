import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jb_fe/backend_integration/domain/usecase/party/get_party_page.dart';
import 'package:jb_fe/backend_integration/domain/usecase/party/search_party.dart';
import 'package:jb_fe/backend_integration/dto/party/party_presentation.dart';

part 'party_event.dart';
part 'party_state.dart';

class PartyBloc extends Bloc<PartyEvent, PartyState> {
  final GetPartyPageUseCase getPartyPage;
  final SearchPartyUseCase searchParty;

  PartyBloc({required this.getPartyPage, required this.searchParty})
      : super(const PartyState()) {
    on<PartyEvent>(_onFetchParty);
  }

  FutureOr<void> _onFetchParty(
      PartyEvent event, Emitter<PartyState> emit) async {
    if (event is SearchPartyDisplay) {
      return _searchPartyDisplay(event, emit);
    }
    if (event is ClearSearchTerm) {
      return _clearSearchTerm(event, emit);
    }
    if (state.hasReachedMax) {
      return null;
    }
    try {
      if (state.status == PartyStatus.initial) {
        final partyList = await getPartyPage(1);
        return emit(state.copyWith(
            status: PartyStatus.success,
            partyList: partyList,
            hasReachedMax: partyList.length < 20));
      }
      print("Your Search term in party bloc: ${state.searchTerm}");
      final partyList = state.searchTerm.isEmpty
          ? await getPartyPage((state.partyList.length ~/ 20) + 1)
          : await searchParty(
              searchTerm: state.searchTerm,
              pageNumber: (state.partyList.length ~/ 20) + 1);
      print("PartyListLength: ${partyList.length}");
      if (partyList.isEmpty) {
        emit(state.copyWith(
          hasReachedMax: true,
        ));
      } else if (partyList.length < 20) {
        emit(state.copyWith(
          hasReachedMax: true,
          partyList: List.of(state.partyList)..addAll(partyList),
          status: PartyStatus.success,
        ));
      } else {
        emit(
          state.copyWith(
            status: PartyStatus.success,
            partyList: List.of(state.partyList)..addAll(partyList),
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(status: PartyStatus.failure),
      );
    }
  }

  FutureOr<void> removePartyFromList(
      RemoveParty event, Emitter<PartyState> emit) {
    final newList = <PartyPresentation>[];
    for (var party in state.partyList) {
      if (party.id != event.partyId) {
        newList.add(party);
      }
    }
    emit(
      state.copyWith(
        status: PartyStatus.success,
        partyList: newList,
      ),
    );
    return null;
  }

  FutureOr<void> _searchPartyDisplay(
      SearchPartyDisplay event, Emitter<PartyState> emit) {
    print("Displaying result for: ${event.searchTerm}");
    emit(state.copyWith(
        partyList: event.searchResult,
        status: PartyStatus.success,
        searchTerm: event.searchTerm));
  }

  FutureOr<void> _clearSearchTerm(
      ClearSearchTerm event, Emitter<PartyState> emit) async {
    emit(state.copyWith(
      partyList: <PartyPresentation>[],
      status: PartyStatus.initial,
      searchTerm: "",
    ));
    final partyList = await getPartyPage(1);
    return emit(
      state.copyWith(
        status: PartyStatus.success,
        partyList: partyList,
        hasReachedMax: partyList.length < 20,
      ),
    );
  }
}
