import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jb_fe/backend_integration/domain/usecase/party/get_party_page.dart';
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

class _ClearSearchTerm extends PartyEvent {}

class PartyBloc extends Bloc<PartyEvent, PartyState>
    with PartyOperationSubscriber, SearchNextPartyPageNotifier {
  final String _id = const Uuid().v4();

  final GetPartyPageUseCase getPartyPage;

  PartyBloc({required this.getPartyPage}) : super(const PartyState()) {
    on<FetchPartyFirstPage>(_onFetchPartyFirstPage);
    on<FetchNextPartyPage>(_fetchNextPartyPage);
    on<_DisplaySearchResult>(_displaySearchResult);
    on<_ClearSearchTerm>(_clearSearchTerm);
    on<_DeleteParty>(_removePartyFromList);
  }

  FutureOr<void> _onFetchPartyFirstPage(
      FetchPartyFirstPage event, Emitter<PartyState> emit) async {
    emit(
      state.copyWith(
        status: PartyStatus.LOADING,
      ),
    );
    try {
      final partyList = await getPartyPage(pageNumber: 1);
      emit(
        state.copyWith(
          status: PartyStatus.SUCCESS,
          partyList: partyList,
          hasReachedMax: partyList.length < 20,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(status: PartyStatus.FAILURE),
      );
    }
  }

  FutureOr<void> _fetchNextPartyPage(
      FetchNextPartyPage event, Emitter<PartyState> emit) async {
    if (state.hasReachedMax == true) {
      return null;
    }
    if (state.needToSearch) {
      notifySubscriber(
        notification: const SearchNextPartyPageRequestNotification(),
      );
      return null;
    }

    final partyList =
        await getPartyPage(pageNumber: (state.partyList.length ~/ 20) + 1);
    emit(state.copyWith(
      hasReachedMax: partyList.length < 20,
      partyList: List.of(state.partyList)..addAll(partyList),
      status: PartyStatus.SUCCESS,
    ));
    return null;
  }

  FutureOr<void> _displaySearchResult(
      _DisplaySearchResult event, Emitter<PartyState> emit) {
    emit(
      state.copyWith(
        status: PartyStatus.LOADING,
      ),
    );
    emit(
      state.copyWith(
        partyList: event.result,
        status: PartyStatus.SUCCESS,
        hasReachedMax: event.result.length < 20,
        needToSearch: true,
      ),
    );
  }

  FutureOr<void> _clearSearchTerm(
      _ClearSearchTerm event, Emitter<PartyState> emit) {
    emit(
      state.copyWith(
        status: PartyStatus.LOADING,
        partyList: <PartyPresentation>[],
        needToSearch: false,
      ),
    );
    add(FetchPartyFirstPage());
  }

  @override
  void update({required OperationNotification notification}) {
    switch (notification.notificationType) {
      case NotificationType.PARTY_DELETED:
        add(
          _DeleteParty(
            partyId: (notification as DeletePartyNotification).partyId,
          ),
        );
        break;
      case NotificationType.PARTY_UPDATED:
        break;
      case NotificationType.PARTY_SEARCH_COMPLETE:
        add(
          _DisplaySearchResult(
            result: (notification as SearchPartyCompleteNotification).result,
          ),
        );
        break;
      case NotificationType.PARTY_SEARCH_CLEARED:
        add(_ClearSearchTerm());
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
        status: PartyStatus.SUCCESS,
        partyList: newList,
      ),
    );
  }

  @override
  String get id => _id;
}
