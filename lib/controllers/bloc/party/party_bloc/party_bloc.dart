import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jb_fe/backend_integration/domain/usecase/party/get_party_page.dart';
import 'package:jb_fe/backend_integration/domain/usecase/party/search_party.dart';
import 'package:jb_fe/backend_integration/dto/party/party_presentation.dart';
import 'package:jb_fe/controllers/bloc/party/mediator/notification/notification.dart';
import 'package:jb_fe/controllers/bloc/party/mediator/notifier/next_page_notifier.dart';
import 'package:jb_fe/controllers/bloc/party/mediator/subscriber/operation_subscriber.dart';
import 'package:uuid/uuid.dart';

part 'party_event.dart';
part 'party_state.dart';

class _DeleteParty extends PartyEvent {
  final String partyId;

  const _DeleteParty({required this.partyId});
}

class _DisplaySearchResult extends PartyEvent {
  final List<PartyPresentation> result;
  const _DisplaySearchResult({required this.result});
}

class PartyBloc extends Bloc<PartyEvent, PartyState>
    with PartyOperationSubscriber, NextPartyPageNotifier {
  final String _id = const Uuid().v4();

  final GetPartyPageUseCase getPartyPage;
  final SearchPartyUseCase searchParty;

  PartyBloc({required this.getPartyPage, required this.searchParty})
      : super(const PartyState()) {
    on<_DeleteParty>(_removePartyFromList);
    on<_DisplaySearchResult>(_displaySearchResult);
    on<FetchNextPartyPage>(_fetchNextPartyPage);
    on<PartyEvent>(_onFetchParty);
  }

  FutureOr<void> _onFetchParty(
      PartyEvent event, Emitter<PartyState> emit) async {
    if (event is _DeleteParty) {
      return null;
    }
    if (event is SearchPartyDisplay) {
      print("SearchPartyDisplayEvent fired");
      return null;
      // return _searchPartyDisplay(event, emit);
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
      final partyList = state.searchTerm.isEmpty
          ? await getPartyPage((state.partyList.length ~/ 20) + 1)
          : await searchParty(
              searchTerm: state.searchTerm,
              pageNumber: (state.partyList.length ~/ 20) + 1);
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

  @override
  void update({required OperationNotification notification}) {
    switch (notification.notificationType) {
      case NotificationType.PARTY_DELETED:
        add(_DeleteParty(
            partyId: (notification as DeletePartyNotification).partyId));
        break;
      case NotificationType.PARTY_UPDATED:
        print("Party Updated in partyBloc");
        break;
      case NotificationType.PARTY_SEARCH_COMPLETE:
        add(
          _DisplaySearchResult(
              result: (notification as SearchPartyCompleteNotification).result),
        );
        break;
      case NotificationType.PARTY_SEARCH_REMOVED:
        // TODO: Handle this case.
        break;
      case NotificationType.PARTY_SEARCH_NEXT_PAGE:
        // TODO: Handle this case.
        break;
    }
  }

  FutureOr<void> _removePartyFromList(
      _DeleteParty event, Emitter<PartyState> emit) {
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
  }

  FutureOr<void> _displaySearchResult(
      _DisplaySearchResult event, Emitter<PartyState> emit) {
    emit(
      state.copyWith(
        partyList: event.result,
        status: PartyStatus.success,
        hasReachedMax: event.result.length < 20,
      ),
    );
  }

  FutureOr<void> _fetchNextPartyPage(
      FetchNextPartyPage event, Emitter<PartyState> emit) {
    // if (state.hasReachedMax == true) {
    //   return null;
    // }
    notifySubscriber(
      notification:
          NextPartyPageRequestNotification(skip: state.partyList.length),
    );
    print("Fetch next page");
  }

  @override
  String get id => _id;
}
