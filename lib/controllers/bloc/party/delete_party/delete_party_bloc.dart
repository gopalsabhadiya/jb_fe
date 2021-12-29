import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jb_fe/backend_integration/domain/usecase/party/delete_party.dart';
import 'package:jb_fe/controllers/bloc/party/mediator/notification/notification.dart';
import 'package:jb_fe/controllers/bloc/party/mediator/notifier/delete_notifier.dart';

part 'delete_party_event.dart';
part 'delete_party_state.dart';

class DeletePartyBloc extends Bloc<DeletePartyEvent, DeletePartyState>
    with DeletePartyNotifier {
  final DeletePartyUseCase deletePartyUseCase;

  DeletePartyBloc({required this.deletePartyUseCase})
      : super(const DeletePartyState()) {
    on<DeletePartyEvent>(_onDeletePartyEvent);
  }

  FutureOr<void> _onDeletePartyEvent(
      DeletePartyEvent event, Emitter<DeletePartyState> emit) async {
    emit(
      state.copyWith(
        deleteStatus: DeletePartyStatus.LOADING,
        lastDeletedPartyId: (event as DeleteParty).partyIdToBeDeleted,
      ),
    );
    try {
      await deletePartyUseCase(partyId: event.partyIdToBeDeleted);
      emit(
        state.copyWith(
          deleteStatus: DeletePartyStatus.COMPLETED,
        ),
      );
      notifySubscriber(
        notification: DeletePartyNotification(
          partyId: event.partyIdToBeDeleted,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          deleteStatus: DeletePartyStatus.ERROR,
        ),
      );
      return null;
    }
  }
}
