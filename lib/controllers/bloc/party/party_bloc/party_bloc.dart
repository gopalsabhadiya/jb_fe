import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jb_fe/backend_integration/domain/usecase/party/get_party_page.dart';
import 'package:jb_fe/backend_integration/dto/party/party_presentation.dart';
import 'package:jb_fe/controllers/bloc/party/mediator/notification/notification.dart';
import 'package:jb_fe/controllers/bloc/party/mediator/notifier/next_page_notifier.dart';
import 'package:jb_fe/controllers/bloc/party/mediator/subscriber/operation_subscriber.dart';
import 'package:jb_fe/util/extension/common_logging.dart';
import 'package:uuid/uuid.dart';

import '../../../../util/logger.dart';

part 'party_event.dart';
part 'party_state.dart';

class _DeleteParty extends PartyEvent {
  final String partyId;

  const _DeleteParty({required this.partyId});
}

class _UpdateParty extends PartyEvent {
  final PartyPresentation updatedParty;
  const _UpdateParty({required this.updatedParty});
}

class _AddParty extends PartyEvent {
  final PartyPresentation addedParty;
  const _AddParty({required this.addedParty});
}

class _DisplaySearchPartyResult extends PartyEvent {
  final List<PartyPresentation> result;
  const _DisplaySearchPartyResult({required this.result});
}

class _ClearSearchTerm extends PartyEvent {}

class PartyBloc extends Bloc<PartyEvent, PartyState>
    with PartyOperationSubscriber, SearchNextPartyPageNotifier {
  final log = getLogger<PartyBloc>();

  final String _id = const Uuid().v4();

  final GetPartyPageUseCase getPartyPageUseCase;

  PartyBloc({required this.getPartyPageUseCase}) : super(const PartyState()) {
    on<FetchPartyFirstPage>(_onFetchPartyFirstPage);
    on<FetchNextPartyPage>(_fetchNextPartyPage);
    on<_DisplaySearchPartyResult>(_displaySearchResult);
    on<_ClearSearchTerm>(_clearSearchTerm);
    on<_DeleteParty>(_removePartyFromList);
    on<_UpdateParty>(_updateParty);
    on<_AddParty>(_addParty);
  }

  FutureOr<void> _onFetchPartyFirstPage(
      FetchPartyFirstPage event, Emitter<PartyState> emit) async {
    log.logEvent<FetchPartyFirstPage>();

    emit(
      state.copyWith(
        status: PartyStatus.LOADING,
      ),
    );
    try {
      final partyList = await getPartyPageUseCase();
      emit(
        state.copyWith(
          status: PartyStatus.SUCCESS,
          partyList: partyList,
          hasReachedMax: partyList.length < 20,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: PartyStatus.FAILURE,
        ),
      );
    }
  }

  FutureOr<void> _fetchNextPartyPage(
      FetchNextPartyPage event, Emitter<PartyState> emit) async {
    log.logEvent<FetchNextPartyPage>();

    if (state.hasReachedMax == true) {
      return null;
    }
    if (state.needToSearch) {
      notifySubscriber(
        notification: const SearchNextPartyPageRequestNotification(),
      );
      return null;
    }

    final partyList = await getPartyPageUseCase(skip: state.partyList.length);
    emit(
      state.copyWith(
        hasReachedMax: partyList.length < 20,
        partyList: List.of(state.partyList)..addAll(partyList),
        status: PartyStatus.SUCCESS,
      ),
    );
    return null;
  }

  FutureOr<void> _displaySearchResult(
      _DisplaySearchPartyResult event, Emitter<PartyState> emit) {
    log.logEvent<_DisplaySearchPartyResult>();

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
    log.logEvent<_ClearSearchTerm>();

    emit(
      state.copyWith(
        status: PartyStatus.LOADING,
        partyList: <PartyPresentation>[],
        needToSearch: false,
      ),
    );
    add(FetchPartyFirstPage());
  }

  FutureOr<void> _removePartyFromList(
      _DeleteParty event, Emitter<PartyState> emit) {
    log.logEvent<_DeleteParty>();

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

  FutureOr<void> _updateParty(_UpdateParty event, Emitter<PartyState> emit) {
    log.logEvent<_UpdateParty>();

    emit(state.copyWith(status: PartyStatus.LOADING));
    final newList = <PartyPresentation>[];
    for (var party in state.partyList) {
      party.id == event.updatedParty.id
          ? newList.add(event.updatedParty)
          : newList.add(party);
    }

    emit(
      state.copyWith(
        status: PartyStatus.SUCCESS,
        partyList: newList,
      ),
    );
  }

  FutureOr<void> _addParty(_AddParty event, Emitter<PartyState> emit) {
    log.logEvent<_AddParty>();

    emit(
      state.copyWith(
        status: PartyStatus.SUCCESS,
        partyList: List.from([event.addedParty])..addAll(state.partyList),
      ),
    );
  }

  @override
  void update({required PartyOperationNotification notification}) {
    log.logReceivedEventNotification(
      notificationType: notification.runtimeType,
    );
    switch (notification.notificationType) {
      case PartyNotificationType.PARTY_DELETED:
        add(
          _DeleteParty(
            partyId: (notification as DeletePartyNotification).partyId,
          ),
        );
        break;
      case PartyNotificationType.PARTY_UPDATED:
        add(
          _UpdateParty(
            updatedParty: (notification as UpdatePartyNotification).party,
          ),
        );
        break;
      case PartyNotificationType.PARTY_SEARCH_COMPLETE:
        add(
          _DisplaySearchPartyResult(
            result: (notification as SearchPartyCompleteNotification).result,
          ),
        );
        break;
      case PartyNotificationType.PARTY_SEARCH_CLEARED:
        add(_ClearSearchTerm());
        break;
      case PartyNotificationType.PARTY_CREATED:
        add(
          _AddParty(
            addedParty: (notification as NewPartyNotification).party,
          ),
        );
        break;
    }
  }

  @override
  String get id => _id;
}
