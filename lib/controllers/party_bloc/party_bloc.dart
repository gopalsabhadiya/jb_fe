import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jb_fe/backend_integration/domain/usecase/party/get_party_page.dart';
import 'package:jb_fe/backend_integration/dto/party/party_presentation.dart';

part 'party_event.dart';
part 'party_state.dart';

class PartyBloc extends Bloc<PartyEvent, PartyState> {
  final GetPartyPageUseCase getPartyPage;

  PartyBloc({required this.getPartyPage}) : super(const PartyState()) {
    on<PartyEvent>(_onFetchParty);
  }

  FutureOr<void> _onFetchParty(
      PartyEvent event, Emitter<PartyState> emit) async {
    if (event is RemoveParty) {
      print("Remove Party: ${event.partyId} ${state.partyList.length}");
      final newList = <PartyPresentation>[];
      state.partyList.forEach((party) {
        if (party.id != event.partyId) {
          newList.add(party);
        }
      });
      print("Removed: ${state.partyList.length}");
      emit(
        state.copyWith(
          status: PartyStatus.success,
          partyList: newList,
        ),
      );
      return null;
    }
    print("AfterCode");
    if (state.hasReachedMax) {
      return null;
    }
    try {
      if (state.status == PartyStatus.initial) {
        final partyList = await getPartyPage(1);
        return emit(state.copyWith(
            status: PartyStatus.success,
            partyList: partyList,
            hasReachedMax: false));
      }
      final partyList = await getPartyPage((state.partyList.length ~/ 20) + 1);
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

  FutureOr<void> _removePartyFromList(
      RemoveParty event, Emitter<PartyState> emit) {
    print("Remove Party: ${event.partyId} ${state.partyList.length}");
    state.partyList.removeWhere((party) => party.id == event.partyId);
    print("Removed: ${state.partyList.length}");
    emit(state.copyWith(
        status: PartyStatus.success, partyList: List.from(state.partyList)));
  }
}
