import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jb_fe/backend_integration/domain/usecase/party/delete_party.dart';
import 'package:jb_fe/controllers/bloc/party/mediator/notification/notification.dart';
import 'package:jb_fe/controllers/bloc/party/mediator/notifier/delete_notifier.dart';
import 'package:jb_fe/util/extension/common_logging.dart';

import '../../../../util/logger.dart';

part 'delete_party_event.dart';
part 'delete_party_state.dart';

class DeletePartyBloc extends Bloc<DeletePartyEvent, DeletePartyState>
    with DeletePartyNotifier {
  final log = getLogger<DeletePartyBloc>();

  final DeletePartyUseCase deletePartyUseCase;

  DeletePartyBloc({required this.deletePartyUseCase})
      : super(const DeletePartyState()) {
    on<DeleteParty>(_onDeleteParty);
  }

  FutureOr<void> _onDeleteParty(
      DeleteParty event, Emitter<DeletePartyState> emit) async {
    log.logEvent<DeleteParty>();
    emit(
      state.copyWith(
        deleteStatus: DeletePartyStatus.LOADING,
        lastDeletedPartyId: event.partyIdToBeDeleted,
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
