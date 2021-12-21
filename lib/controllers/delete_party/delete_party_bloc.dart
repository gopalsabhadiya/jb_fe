import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jb_fe/backend_integration/domain/usecase/party/delete_party.dart';

part 'delete_party_event.dart';
part 'delete_party_state.dart';

class DeletePartyBloc extends Bloc<DeletePartyEvent, DeletePartyState> {
  final DeletePartyUseCase deletePartyUseCase;

  DeletePartyBloc({required this.deletePartyUseCase})
      : super(const DeletePartyState()) {
    on<DeletePartyEvent>(_onDeletePartyEvent);
  }

  FutureOr<void> _onDeletePartyEvent(
      DeletePartyEvent event, Emitter<DeletePartyState> emit) async {
    print("Deleting party");
    emit(
      state.copyWith(
        deleteStatus: DeletePartyStatus.LOADING,
        lastDeletedPartyId: (event as DeleteParty).partyIdToBeDeleted,
      ),
    );
    print("Deleting party: Loading");

    try {
      deletePartyUseCase(partyId: event.partyIdToBeDeleted);
      print("Deleting party: completer");

      emit(
        state.copyWith(
          deleteStatus: DeletePartyStatus.COMPLETED,
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
