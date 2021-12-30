import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jb_fe/backend_integration/domain/usecase/inventory/search_item.dart';
import 'package:jb_fe/backend_integration/dto/item/item_presentation.dart';
import 'package:jb_fe/constants/texts/defaults.dart';
import 'package:jb_fe/controllers/bloc/inventory/mediator/notification/notification.dart';
import 'package:jb_fe/controllers/bloc/inventory/mediator/notifier/search_notifier.dart';
import 'package:jb_fe/controllers/bloc/inventory/mediator/subscriber/operation_subscriber.dart';
import 'package:uuid/uuid.dart';

part 'search_item_event.dart';
part 'search_item_state.dart';

class SearchItemBloc extends Bloc<SearchItemEvent, SearchItemState>
    with SearchItemNotifier, ItemOperationSubscriber {
  final String _id = const Uuid().v4();

  final SearchItemUseCase searchItemUseCase;

  SearchItemBloc({required this.searchItemUseCase})
      : super(const SearchItemState()) {
    on<SearchItem>(_onSearchItem);
    on<ClearSearchItemTerm>(_onClearSearchTerm);
  }

  FutureOr<void> _onSearchItem(
      SearchItem event, Emitter<SearchItemState> emit) async {
    emit(
      state.copyWith(
        searchStatus: SearchItemStatus.LOADING,
      ),
    );
    try {
      final searchResult = await searchItemUseCase(
        searchTerm: event.searchTerm,
      );
      print("Searched items: ${searchResult.length}");
      emit(
        state.copyWith(
          searchStatus: SearchItemStatus.COMPLETED,
          searchTerm: event.searchTerm,
          result: List.of(state.result)..addAll(searchResult),
        ),
      );
      notifySubscriber(
        notification: SearchItemCompleteNotification(
          result: state.result,
          searchTerm: state.searchTerm,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          searchStatus: SearchItemStatus.ERROR,
        ),
      );
      return null;
    }
  }

  FutureOr<void> _onClearSearchTerm(
      ClearSearchItemTerm event, Emitter<SearchItemState> emit) {
    print("Clearing search term");
    emit(
      state.copyWith(
        result: <ItemPresentation>[],
        searchTerm: DefaultTexts.EMPTY,
        searchStatus: SearchItemStatus.COMPLETED,
      ),
    );
    notifySubscriber(
      notification: const SearchItemTermClearedNotification(),
    );
    return null;
  }

  @override
  void update({required ItemOperationNotification notification}) async {
    print("Search next page: $notification");
    final searchResult = await searchItemUseCase(
      searchTerm: state.searchTerm,
      pageNumber: (state.result.length ~/ 20) + 1,
    );
    notifySubscriber(
      notification: SearchItemCompleteNotification(
        result: List.of(state.result)..addAll(searchResult),
        searchTerm: state.searchTerm,
      ),
    );
  }

  @override
  String get id => _id;
}
