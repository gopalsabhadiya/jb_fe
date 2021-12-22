import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jb_fe/backend_integration/domain/usecase/party/search_party.dart';
import 'package:jb_fe/backend_integration/dto/party/party_presentation.dart';

part 'search_party_event.dart';
part 'search_party_state.dart';

class SearchPartyBloc extends Bloc<SearchPartyEvent, SearchPartyState> {
  final SearchPartyUseCase searchPartyUseCase;

  SearchPartyBloc({required this.searchPartyUseCase})
      : super(const SearchPartyState()) {
    on<SearchPartyEvent>(_onSearchPartyEvent);
  }

  FutureOr<void> _onSearchPartyEvent(
      SearchPartyEvent event, Emitter<SearchPartyState> emit) async {
    emit(
      state.copyWith(
        searchStatus: SearchPartyStatus.LOADING,
      ),
    );
    try {
      final searchResult = await searchPartyUseCase(
        searchTerm: (event as SearchParty).searchTerm,
      );
      emit(
        state.copyWith(
          searchStatus: SearchPartyStatus.COMPLETED,
          searchTerm: event.searchTerm,
          result: searchResult,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          searchStatus: SearchPartyStatus.ERROR,
        ),
      );
      return null;
    }
  }
}
