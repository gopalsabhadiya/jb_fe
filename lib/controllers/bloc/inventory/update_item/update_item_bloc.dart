import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jb_fe/backend_integration/domain/usecase/inventory/update_item.dart';
import 'package:jb_fe/backend_integration/dto/item/item_presentation.dart';
import 'package:jb_fe/controllers/bloc/inventory/mediator/notification/notification.dart';
import 'package:jb_fe/controllers/bloc/inventory/mediator/notifier/update_notifier.dart';
import 'package:jb_fe/util/extension/common_logging.dart';

import '../../../../util/logger.dart';

part 'update_item_event.dart';
part 'update_item_state.dart';

class UpdateItemBloc extends Bloc<UpdateItemEvent, UpdateItemState>
    with UpdateItemNotifier {
  final log = getLogger<UpdateItemBloc>();

  final UpdateItemUseCase updateItemUseCase;

  UpdateItemBloc({required this.updateItemUseCase})
      : super(const UpdateItemState()) {
    on<UpdateItem>(_onUpdateItem);
  }

  FutureOr<void> _onUpdateItem(
      UpdateItem event, Emitter<UpdateItemState> emit) async {
    log.logEvent<UpdateItem>();

    emit(
      const UpdateItemState(
        status: UpdateItemStatus.LOADING,
      ),
    );
    try {
      await updateItemUseCase(item: event.item);
      emit(
        const UpdateItemState(
          status: UpdateItemStatus.COMPLETED,
        ),
      );
      notifySubscriber(
        notification: UpdateItemNotification(
          item: event.item,
        ),
      );
    } catch (e) {
      print("Error: $e");
      emit(
        const UpdateItemState(
          status: UpdateItemStatus.ERROR,
        ),
      );
    }
  }
}
