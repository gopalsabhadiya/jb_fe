import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jb_fe/backend_integration/domain/usecase/inventory/delete_item.dart';
import 'package:jb_fe/controllers/bloc/inventory/mediator/notification/notification.dart';
import 'package:jb_fe/controllers/bloc/inventory/mediator/notifier/delete_notifier.dart';

part 'delete_item_event.dart';
part 'delete_item_state.dart';

class DeleteItemBloc extends Bloc<DeleteItemEvent, DeleteItemState>
    with DeleteItemNotifier {
  final DeleteItemUseCase deleteItemUseCase;

  DeleteItemBloc({required this.deleteItemUseCase})
      : super(const DeleteItemState()) {
    on<DeleteItem>(_onDeleteItem);
  }

  FutureOr<void> _onDeleteItem(
      DeleteItem event, Emitter<DeleteItemState> emit) async {
    emit(
      state.copyWith(
        deleteStatus: DeleteItemStatus.LOADING,
        lastDeletedItemId: event.itemIdToBeDeleted,
      ),
    );
    try {
      await deleteItemUseCase(itemId: event.itemIdToBeDeleted);
      emit(
        state.copyWith(
          deleteStatus: DeleteItemStatus.COMPLETED,
        ),
      );
      notifySubscriber(
        notification: DeleteItemNotification(
          itemId: event.itemIdToBeDeleted,
        ),
      );
    } catch (e) {
      emit(state.copyWith(
        deleteStatus: DeleteItemStatus.ERROR,
      ));
    }
  }
}
