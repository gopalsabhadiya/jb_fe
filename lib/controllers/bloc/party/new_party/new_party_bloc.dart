import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jb_fe/backend_integration/domain/usecase/party/create_party.dart';
import 'package:jb_fe/backend_integration/dto/party/party_presentation.dart';
import 'package:jb_fe/controllers/bloc/party/mediator/notification/notification.dart';
import 'package:jb_fe/controllers/bloc/party/mediator/notifier/create_notifier.dart';

part 'new_party_event.dart';
part 'new_party_state.dart';

class NewPartyBloc extends Bloc<NewPartyEvent, NewPartyState>
    with CreatePartyNotifier {
  final CreatePartyUseCase createPartyUseCase;

  NewPartyBloc({required this.createPartyUseCase})
      : super(const NewPartyState()) {
    on<NewPartyEvent>(_onNewPartyEvent);
  }

  FutureOr<void> _onNewPartyEvent(
      NewPartyEvent event, Emitter<NewPartyState> emit) async {
    emit(const NewPartyState(status: NewPartyStatus.LOADING));
    try {
      createPartyUseCase(party: (event as NewParty).partyPresentation);
      emit(const NewPartyState(status: NewPartyStatus.COMPLETED));
      notifySubscriber(
        notification: NewPartyNotification(
          party: event.partyPresentation,
        ),
      );
    } catch (e) {
      emit(const NewPartyState(status: NewPartyStatus.ERROR));
      return null;
    }
  }
}
