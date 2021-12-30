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

  final GetItemPageUseCase getItemPageUseCase;

  ItemBloc({required this.getItemPageUseCase}) : super(const ItemState()) {
    on<FetchItemFirstPage>(_onFetchItemFirstPage);
    on<FetchNextItemPage>(_fetchNextItemPage);
    on<_DisplaySearchItemResult>(_displaySearchResult);
    on<_ClearSearchTerm>(_clearSearchTerm);
    on<_DeleteItem>(_removeItemFromList);
    on<_UpdateItem>(_updateItem);
    on<_AddItem>(_addItem);
  }

  FutureOr<void> _onFetchItemFirstPage(
      FetchItemFirstPage event, Emitter<ItemState> emit) async {
    emit(
      state.copyWith(
        status: ItemStatus.LOADING,
      ),
    );
    try {
      final itemList = await getItemPageUseCase(pageNumber: 1);
      print("Returning Item List: $itemList");
      emit(
        state.copyWith(
          status: ItemStatus.SUCCESS,
          itemList: itemList,
          hasReachedMax: itemList.length < 20,
        ),
      );
    } catch (e) {
      print("Exception caught: $e");
      emit(
        state.copyWith(
          status: ItemStatus.FAILURE,
        ),
      );
    }
  }

  FutureOr<void> _fetchNextItemPage(
      FetchNextItemPage event, Emitter<ItemState> emit) async {
    print("Fetch next page");
    if (state.hasReachedMax == true) {
      return null;
    }
    if (state.needToSearch) {
      notifySubscriber(
        notification: const SearchNextItemPageRequestNotification(),
      );
      return null;
    }

    final itemList =
        await getItemPageUseCase(pageNumber: (state.itemList.length ~/ 20) + 1);
    emit(
      state.copyWith(
        hasReachedMax: itemList.length < 20,
        itemList: List.of(state.itemList)..addAll(itemList),
        status: ItemStatus.SUCCESS,
      ),
    );
    return null;
  }

  FutureOr<void> _displaySearchResult(
      _DisplaySearchItemResult event, Emitter<ItemState> emit) {
    emit(
      state.copyWith(
        status: ItemStatus.LOADING,
      ),
    );
    emit(
      state.copyWith(
        itemList: event.result,
        status: ItemStatus.SUCCESS,
        hasReachedMax: event.result.length < 20,
        needToSearch: true,
      ),
    );
  }

  FutureOr<void> _clearSearchTerm(
      _ClearSearchTerm event, Emitter<ItemState> emit) {
    emit(
      state.copyWith(
        status: ItemStatus.LOADING,
        itemList: <ItemPresentation>[],
        needToSearch: false,
      ),
    );
    add(FetchItemFirstPage());
  }

  FutureOr<void> _removeItemFromList(
      _DeleteItem event, Emitter<ItemState> emit) {
    final newList = <ItemPresentation>[];
    for (var item in state.itemList) {
      if (item.id != event.itemId) {
        newList.add(item);
      }
    }
    emit(
      state.copyWith(
        status: ItemStatus.SUCCESS,
        itemList: newList,
      ),
    );
  }

  FutureOr<void> _updateItem(_UpdateItem event, Emitter<ItemState> emit) {
    emit(state.copyWith(status: ItemStatus.LOADING));
    final newList = <ItemPresentation>[];
    for (var item in state.itemList) {
      item.id == event.updatedItem.id
          ? newList.add(event.updatedItem)
          : newList.add(item);
    }

    emit(
      state.copyWith(
        status: ItemStatus.SUCCESS,
        itemList: newList,
      ),
    );
  }

  FutureOr<void> _addItem(_AddItem event, Emitter<ItemState> emit) {
    emit(
      state.copyWith(
        status: ItemStatus.SUCCESS,
        itemList: List.from([event.addedItem])..addAll(state.itemList),
      ),
    );
  }

  @override
  void update({required ItemOperationNotification notification}) {
    switch (notification.notificationType) {
      case ItemNotificationType.ITEM_DELETED:
        add(
          _DeleteItem(
            itemId: (notification as DeleteItemNotification).itemId,
          ),
        );
        break;
      case ItemNotificationType.ITEM_UPDATED:
        add(
          _UpdateItem(
            updatedItem: (notification as UpdateItemNotification).item,
          ),
        );
        break;
      case ItemNotificationType.ITEM_CREATED:
        add(
          _AddItem(
            addedItem: (notification as NewItemNotification).item,
          ),
        );
        break;
      case ItemNotificationType.ITEM_SEARCH_COMPLETE:
        add(
          _DisplaySearchItemResult(
            result: (notification as SearchItemCompleteNotification).result,
          ),
        );
        break;
      case ItemNotificationType.ITEM_SEARCH_CLEARED:
        add(_ClearSearchTerm());
        break;
    }
  }

  @override
  String get id => _id;
}
