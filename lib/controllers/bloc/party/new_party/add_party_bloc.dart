import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jb_fe/backend_integration/domain/usecase/party/create_party.dart';
import 'package:jb_fe/backend_integration/dto/party/party_presentation.dart';
import 'package:jb_fe/controllers/bloc/party/mediator/notification/notification.dart';
import 'package:jb_fe/controllers/bloc/party/mediator/notifier/add_notifier.dart';

part 'add_party_event.dart';
part 'add_party_state.dart';

class AddPartyBloc extends Bloc<AddPartyEvent, AddPartyState>
    with CreatePartyNotifier {
  final CreatePartyUseCase createPartyUseCase;

  AddPartyBloc({required this.createPartyUseCase})
      : super(const AddPartyState()) {
    on<AddNewParty>(_onNewPartyEvent);
  }

  FutureOr<void> _onNewPartyEvent(
      AddNewParty event, Emitter<AddPartyState> emit) async {
    emit(const AddPartyState(status: AddPartyStatus.LOADING));
    try {
      final savedParty =
          await createPartyUseCase(party: event.partyPresentation);
      await Future.delayed(const Duration(seconds: 1));
      emit(const AddPartyState(status: AddPartyStatus.COMPLETED));
      notifySubscriber(
        notification: NewPartyNotification(
          party: savedParty,
        ),
      );
    } catch (e) {
      print("Error caught: $e");
      emit(const AddPartyState(status: AddPartyStatus.ERROR));
      return null;
    }
  }
}
