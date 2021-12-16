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
    emit(DeletePartyState(deleteStatus: DeletePartyStatus.LOADING));
    await Future.delayed(Duration(seconds: 2));
    emit(
      DeletePartyState(
        deleteStatus: DeletePartyStatus.COMPLETED,
        lastDeletedPartyId: (event as DeleteParty).partyIdToBeDeleted,
      ),
    );
    // emit(const DeletePartyState(deleteStatus: DeletePartyStatus.LOADING));
    // try {
    //   deletePartyUseCase(partyId: (event as DeleteParty).partyIdToBeDeleted);
    //   emit(const DeletePartyState(deleteStatus: DeletePartyStatus.COMPLETED));
    // } catch (e) {
    //   emit(const DeletePartyState(deleteStatus: DeletePartyStatus.ERROR));
    //   return null;
    // }
  }
}
