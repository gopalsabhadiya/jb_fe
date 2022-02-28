import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jb_fe/backend_integration/domain/usecase/inventory/create_item.dart';
import 'package:jb_fe/backend_integration/dto/item/item_presentation.dart';
import 'package:jb_fe/controllers/bloc/inventory/mediator/notification/notification.dart';
import 'package:jb_fe/controllers/bloc/inventory/mediator/notifier/add_notifier.dart';
import 'package:jb_fe/util/extension/common_logging.dart';

import '../../../../util/logger.dart';

part 'add_item_event.dart';
part 'add_item_state.dart';

class AddItemBloc extends Bloc<AddItemEvent, AddItemState>
    with AddItemNotifier {
  final log = getLogger<AddItemBloc>();

  final CreateItemUseCase createItemUseCase;

  AddItemBloc({required this.createItemUseCase}) : super(const AddItemState()) {
    on<AddNewItem>(_onAddNewItem);
  }

  FutureOr<void> _onAddNewItem(
      AddNewItem event, Emitter<AddItemState> emit) async {
    log.logEvent<AddNewItem>();
    emit(const AddItemState(status: AddItemStatus.LOADING));
    try {
      final savedItem = await createItemUseCase(item: event.item);
      await Future.delayed(const Duration(seconds: 1));
      emit(const AddItemState(status: AddItemStatus.COMPLETED));
      notifySubscriber(notification: NewItemNotification(item: savedItem));
    } catch (e) {
      print("Error caught: $e");
      emit(const AddItemState(status: AddItemStatus.ERROR));
      return null;
    }
  }
}
