import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jb_fe/backend_integration/domain/usecase/party/search_party.dart';
import 'package:jb_fe/backend_integration/dto/party/party_presentation.dart';
import 'package:jb_fe/constants/texts/defaults.dart';
import 'package:jb_fe/controllers/bloc/party/mediator/notification/notification.dart';
import 'package:jb_fe/controllers/bloc/party/mediator/notifier/search_notifier.dart';
import 'package:jb_fe/controllers/bloc/party/mediator/subscriber/operation_subscriber.dart';
import 'package:uuid/uuid.dart';

part 'search_party_event.dart';
part 'search_party_state.dart';

class SearchPartyBloc extends Bloc<SearchPartyEvent, SearchPartyState>
    with SearchPartyNotifier, PartyOperationSubscriber {
  final String _id = const Uuid().v4();

  final SearchPartyUseCase searchPartyUseCase;

  SearchPartyBloc({required this.searchPartyUseCase})
      : super(const SearchPartyState()) {
    on<SearchParty>(_onSearchParty);
    on<ClearSearchPartyTerm>(_onClearSearchTerm);
  }

  FutureOr<void> _onSearchParty(
      SearchParty event, Emitter<SearchPartyState> emit) async {
    emit(
      state.copyWith(
        searchStatus: SearchPartyStatus.LOADING,
      ),
    );
    try {
      final searchResult = await searchPartyUseCase(
        searchTerm: event.searchTerm,
      );
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

  FutureOr<void> _onClearSearchTerm(
      ClearSearchPartyTerm event, Emitter<SearchPartyState> emit) {
    print("Clearin search term");
    emit(
      state.copyWith(
        result: <PartyPresentation>[],
        searchTerm: DefaultTexts.EMPTY,
        searchStatus: SearchPartyStatus.COMPLETED,
      ),
    );
    notifySubscriber(
      notification: const SearchPartyTermClearedNotification(),
    );
    return null;
  }

  @override
  void update({required PartyOperationNotification notification}) async {
    print("Search next page: ${notification}");
    final searchResult = await searchPartyUseCase(
      searchTerm: state.searchTerm,
      pageNumber: (state.result.length ~/ 20) + 1,
    );
    notifySubscriber(
      notification: SearchPartyCompleteNotification(
        result: List.of(state.result)..addAll(searchResult),
        searchTerm: state.searchTerm,
      ),
    );
  }

  @override
  String get id => _id;
}
