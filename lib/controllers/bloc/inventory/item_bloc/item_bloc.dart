import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jb_fe/backend_integration/domain/usecase/inventory/get_item_page.dart';
import 'package:jb_fe/backend_integration/dto/item/item_presentation.dart';
import 'package:jb_fe/controllers/bloc/inventory/mediator/notification/notification.dart';
import 'package:jb_fe/controllers/bloc/inventory/mediator/notifier/next_page_notifier.dart';
import 'package:jb_fe/controllers/bloc/inventory/mediator/subscriber/operation_subscriber.dart';
import 'package:uuid/uuid.dart';

part 'item_event.dart';
part 'item_state.dart';

class _DeleteItem extends ItemEvent {
  final String itemId;

  const _DeleteItem({required this.itemId});
}

class _UpdateItem extends ItemEvent {
  final ItemPresentation updatedItem;
  const _UpdateItem({required this.updatedItem});
}

class _AddItem extends ItemEvent {
  final ItemPresentation addedItem;
  const _AddItem({required this.addedItem});
}

class _DisplaySearchItemResult extends ItemEvent {
  final List<ItemPresentation> result;
  const _DisplaySearchItemResult({required this.result});
}

class _ClearSearchTerm extends ItemEvent {}

class ItemBloc extends Bloc<ItemEvent, ItemState>
    with ItemOperationSubscriber, SearchNextItemPageNotifier {
  final String _id = const Uuid().v4();

  final GetItemPageUseCase getItemPage;

  ItemBloc({required this.getItemPage}) : super(const ItemState()) {
    on<FetchItemFirstPage>(_onFetchItemFirstPage);
    on<FetchNextItemPage>(_fetchNextItemPage);
    on<_DisplaySearchItemResult>(_displaySearchResult);
    on<_ClearSearchTerm>(_clearSearchTerm);
    on<_DeleteItem>(_removeItemFromList);
    on<_UpdateItem>(_updateItem);
    on<_AddItem>(_addItem);
  }

  FutureOr<void> _onFetchItemFirstPage(
      FetchItemFirstPage event, Emitter<ItemState> emit) {}

  FutureOr<void> _fetchNextItemPage(
      FetchNextItemPage event, Emitter<ItemState> emit) {}

  FutureOr<void> _displaySearchResult(
      _DisplaySearchItemResult event, Emitter<ItemState> emit) {}

  FutureOr<void> _clearSearchTerm(
      _ClearSearchTerm event, Emitter<ItemState> emit) {}

  FutureOr<void> _removeItemFromList(
      _DeleteItem event, Emitter<ItemState> emit) {}

  FutureOr<void> _updateItem(_UpdateItem event, Emitter<ItemState> emit) {}

  FutureOr<void> _addItem(_AddItem event, Emitter<ItemState> emit) {}

  @override
  void update({required ItemOperationNotification notification}) {
    // TODO: implement update
  }

  @override
  String get id => _id;
}
