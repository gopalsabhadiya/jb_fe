import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jb_fe/backend_integration/domain/usecase/party/search_party.dart';
import 'package:jb_fe/backend_integration/dto/party/party_presentation.dart';
import 'package:jb_fe/controllers/bloc/party/mediator/notification/notification.dart';
import 'package:jb_fe/controllers/bloc/party/mediator/notifier/search_notifier.dart';
import 'package:jb_fe/controllers/bloc/party/mediator/subscriber/operation_subscriber.dart';

part 'search_party_event.dart';
part 'search_party_state.dart';

class SearchPartyBloc extends Bloc<SearchPartyEvent, SearchPartyState>
    with SearchPartyNotifier, PartyOperationSubscriber {
  final SearchPartyUseCase searchPartyUseCase;

  SearchPartyBloc({required this.searchPartyUseCase})
      : super(const SearchPartyState()) {
    on<SearchPartyEvent>(_onSearchPartyEvent);
    on<ClearSearchTerm>(_onClearSearchTerm);
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
      print("Searched parties: ${searchResult.length}");
      emit(
        state.copyWith(
          searchStatus: SearchPartyStatus.COMPLETED,
          searchTerm: event.searchTerm,
          result: List.of(state.result)..addAll(searchResult),
        ),
      );
      notifySubscriber(
        notification: SearchPartyCompleteNotification(
          result: state.result,
          searchTerm: state.searchTerm,
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

  @override
  // TODO: implement id
  String get id => throw UnimplementedError();

  @override
  void update({required OperationNotification notification}) async {
    print("Search next page: ${notification}");
    final searchResult = await searchPartyUseCase(
        searchTerm: state.searchTerm,
        pageNumber: (state.result.length ~/ 20) + 1);
    notifySubscriber(
      notification: SearchPartyCompleteNotification(
        result: List.of(state.result)..addAll(searchResult),
        searchTerm: state.searchTerm,
      ),
    );
  }

  FutureOr<void> _onClearSearchTerm(
      ClearSearchTerm event, Emitter<SearchPartyState> emit) {
    print("Clearin search term");
    emit(state.copyWith(
      result: <PartyPresentation>[],
      searchTerm: "",
      searchStatus: SearchPartyStatus.COMPLETED,
    ));
    notifySubscriber(
      notification: const SearchPartyTermClearedNotification(),
    );
    return null;
  }
}
