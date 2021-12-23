import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jb_fe/backend_integration/domain/usecase/party/update_party.dart';
import 'package:jb_fe/backend_integration/dto/party/party_presentation.dart';
import 'package:jb_fe/controllers/bloc/party/mediator/notification/notification.dart';
import 'package:jb_fe/controllers/bloc/party/mediator/notifier/update_notifier.dart';

part 'update_party_event.dart';
part 'update_party_state.dart';

class UpdatePartyBloc extends Bloc<UpdatePartyEvent, UpdatePartyState>
    with UpdatePartyNotifier {
  final UpdatePartyUseCase updatePartyUseCase;

  UpdatePartyBloc({required this.updatePartyUseCase})
      : super(const UpdatePartyState()) {
    on<UpdatePartyEvent>(_onUpdatePartyEvent);
  }

  FutureOr<void> _onUpdatePartyEvent(
      UpdatePartyEvent event, Emitter<UpdatePartyState> emit) async {
    emit(const UpdatePartyState(updateStatus: UpdatePartyStatus.LOADING));
    try {
      updatePartyUseCase(party: (event as UpdateParty).partyPresentation);
      emit(const UpdatePartyState(updateStatus: UpdatePartyStatus.COMPLETED));
      notifySubscriber(
        notification: UpdatePartyNotification(
          party: event.partyPresentation,
        ),
      );
    } catch (e) {
      emit(const UpdatePartyState(updateStatus: UpdatePartyStatus.ERROR));
      return null;
    }
  }
}
