import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jb_fe/backend_integration/domain/usecase/party/update_party.dart';
import 'package:jb_fe/backend_integration/dto/party/party_presentation.dart';
import 'package:jb_fe/controllers/bloc/party/mediator/notification/notification.dart';
import 'package:jb_fe/controllers/bloc/party/mediator/notifier/update_notifier.dart';
import 'package:jb_fe/util/extension/common_logging.dart';

import '../../../../util/logger.dart';

part 'update_party_event.dart';
part 'update_party_state.dart';

class UpdatePartyBloc extends Bloc<UpdatePartyEvent, UpdatePartyState>
    with UpdatePartyNotifier {
  final log = getLogger<UpdatePartyBloc>();

  final UpdatePartyUseCase updatePartyUseCase;

  UpdatePartyBloc({required this.updatePartyUseCase})
      : super(const UpdatePartyState()) {
    on<UpdateParty>(_onUpdateParty);
  }

  FutureOr<void> _onUpdateParty(
      UpdateParty event, Emitter<UpdatePartyState> emit) async {
    log.logEvent<UpdateParty>();

    emit(
      const UpdatePartyState(
        status: UpdatePartyStatus.LOADING,
      ),
    );
    try {
      await updatePartyUseCase(party: event.party);
      emit(
        const UpdatePartyState(
          status: UpdatePartyStatus.COMPLETED,
        ),
      );
      notifySubscriber(
        notification: UpdatePartyNotification(
          party: event.party,
        ),
      );
    } catch (e) {
      emit(
        const UpdatePartyState(
          status: UpdatePartyStatus.ERROR,
        ),
      );
      return null;
    }
  }
}
