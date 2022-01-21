import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jb_fe/backend_integration/domain/usecase/order/search_order.dart';
import 'package:jb_fe/backend_integration/dto/order/order_presentation.dart';
import 'package:jb_fe/constants/texts/defaults.dart';
import 'package:jb_fe/controllers/bloc/order/mediator/notification/notification.dart';
import 'package:jb_fe/controllers/bloc/order/mediator/notifier/search_notifier.dart';
import 'package:jb_fe/controllers/bloc/order/mediator/subscriber/operation_subscriber.dart';
import 'package:uuid/uuid.dart';

part 'search_order_event.dart';
part 'search_order_state.dart';

class SearchOrderBloc extends Bloc<SearchOrderEvent, SearchOrderState>
    with SearchOrderNotifier, OrderOperationSubscriber {
  final String _id = const Uuid().v4();

  final SearchOrderUseCase searchOrderUseCase;

  SearchOrderBloc({required this.searchOrderUseCase})
      : super(const SearchOrderState()) {
    on<SearchOrder>(_onSearchOrder);
    on<ClearSearchOrderTerm>(_onClearSearchTerm);
  }

  FutureOr<void> _onSearchOrder(
      SearchOrder event, Emitter<SearchOrderState> emit) async {
    emit(
      state.copyWith(
        searchStatus: SearchOrderStatus.LOADING,
      ),
    );
    try {
      final searchResult = await searchOrderUseCase(
        searchTerm: event.searchTerm,
      );
      emit(
        state.copyWith(
          searchStatus: SearchOrderStatus.COMPLETED,
          searchTerm: event.searchTerm,
          result: List.of(state.result)..addAll(searchResult),
        ),
      );
      notifySubscriber(
        notification: SearchOrderCompleteNotification(
          result: state.result,
          searchTerm: state.searchTerm,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          searchStatus: SearchOrderStatus.ERROR,
        ),
      );
      return null;
    }
  }

  FutureOr<void> _onClearSearchTerm(
      ClearSearchOrderTerm event, Emitter<SearchOrderState> emit) {
    emit(
      state.copyWith(
        result: <OrderPresentation>[],
        searchTerm: DefaultTexts.EMPTY,
        searchStatus: SearchOrderStatus.COMPLETED,
      ),
    );
    notifySubscriber(
      notification: const SearchOrderTermClearedNotification(),
    );
    return null;
  }

  @override
  void update({required OrderOperationNotification notification}) async {
    final searchResult = await searchOrderUseCase(
      searchTerm: state.searchTerm,
      skip: state.result.length,
    );
    notifySubscriber(
      notification: SearchOrderCompleteNotification(
        result: List.of(state.result)..addAll(searchResult),
        searchTerm: state.searchTerm,
      ),
    );
  }

  @override
  String get id => _id;
}
