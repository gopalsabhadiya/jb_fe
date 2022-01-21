import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jb_fe/backend_integration/domain/usecase/order/get_order_page.dart';
import 'package:jb_fe/backend_integration/dto/order/order_presentation.dart';
import 'package:jb_fe/controllers/bloc/order/mediator/notification/notification.dart';
import 'package:jb_fe/controllers/bloc/order/mediator/notifier/next_page_notifier.dart';
import 'package:jb_fe/controllers/bloc/order/mediator/subscriber/operation_subscriber.dart';
import 'package:uuid/uuid.dart';

part 'order_event.dart';
part 'order_state.dart';

class _DeleteOrder extends OrderEvent {
  final String orderId;

  const _DeleteOrder({required this.orderId});
}

class _UpdateOrder extends OrderEvent {
  final OrderPresentation updatedOrder;
  const _UpdateOrder({required this.updatedOrder});
}

class _AddOrder extends OrderEvent {
  final OrderPresentation addedOrder;
  const _AddOrder({required this.addedOrder});
}

class _DisplaySearchOrderResult extends OrderEvent {
  final List<OrderPresentation> result;
  const _DisplaySearchOrderResult({required this.result});
}

class _ClearSearchTerm extends OrderEvent {}

class OrderBloc extends Bloc<OrderEvent, OrderState>
    with OrderOperationSubscriber, SearchNextOrderPageNotifier {
  final String _id = const Uuid().v4();

  final GetOrderPageUseCase getOrderPageUseCase;

  OrderBloc({required this.getOrderPageUseCase}) : super(const OrderState()) {
    on<FetchOrderFirstPage>(_onFetchOrderFirstPage);
    on<FetchNextOrderPage>(_fetchNextOrderPage);
    on<_DisplaySearchOrderResult>(_displaySearchResult);
    on<_ClearSearchTerm>(_clearSearchTerm);
    on<_DeleteOrder>(_removeOrderFromList);
    on<_UpdateOrder>(_updateOrder);
    on<_AddOrder>(_addOrder);
  }

  FutureOr<void> _onFetchOrderFirstPage(
      FetchOrderFirstPage event, Emitter<OrderState> emit) async {
    emit(
      state.copyWith(
        status: OrderStatus.LOADING,
      ),
    );
    try {
      final orderList = await getOrderPageUseCase();
      emit(
        state.copyWith(
          status: OrderStatus.SUCCESS,
          orderList: orderList,
          hasReachedMax: orderList.length < 20,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: OrderStatus.FAILURE,
        ),
      );
    }
  }

  FutureOr<void> _fetchNextOrderPage(
      FetchNextOrderPage event, Emitter<OrderState> emit) async {
    if (state.hasReachedMax == true) {
      return null;
    }
    if (state.needToSearch) {
      notifySubscriber(
        notification: const SearchNextOrderPageRequestNotification(),
      );
      return null;
    }

    final orderList = await getOrderPageUseCase(skip: state.orderList.length);
    emit(
      state.copyWith(
        hasReachedMax: orderList.length < 20,
        orderList: List.of(state.orderList)..addAll(orderList),
        status: OrderStatus.SUCCESS,
      ),
    );
    return null;
  }

  FutureOr<void> _displaySearchResult(
      _DisplaySearchOrderResult event, Emitter<OrderState> emit) {
    emit(
      state.copyWith(
        status: OrderStatus.LOADING,
      ),
    );
    emit(
      state.copyWith(
        orderList: event.result,
        status: OrderStatus.SUCCESS,
        hasReachedMax: event.result.length < 20,
        needToSearch: true,
      ),
    );
  }

  FutureOr<void> _clearSearchTerm(
      _ClearSearchTerm event, Emitter<OrderState> emit) {
    emit(
      state.copyWith(
        status: OrderStatus.LOADING,
        orderList: <OrderPresentation>[],
        needToSearch: false,
      ),
    );
    add(FetchOrderFirstPage());
  }

  FutureOr<void> _removeOrderFromList(
      _DeleteOrder event, Emitter<OrderState> emit) {
    final newList = <OrderPresentation>[];
    for (var order in state.orderList) {
      if (order.id != event.orderId) {
        newList.add(order);
      }
    }
    emit(
      state.copyWith(
        status: OrderStatus.SUCCESS,
        orderList: newList,
      ),
    );
  }

  FutureOr<void> _updateOrder(_UpdateOrder event, Emitter<OrderState> emit) {
    emit(state.copyWith(status: OrderStatus.LOADING));
    final newList = <OrderPresentation>[];
    for (var order in state.orderList) {
      order.id == event.updatedOrder.id
          ? newList.add(event.updatedOrder)
          : newList.add(order);
    }

    emit(
      state.copyWith(
        status: OrderStatus.SUCCESS,
        orderList: newList,
      ),
    );
  }

  FutureOr<void> _addOrder(_AddOrder event, Emitter<OrderState> emit) {
    emit(
      state.copyWith(
        status: OrderStatus.SUCCESS,
        orderList: List.from([event.addedOrder])..addAll(state.orderList),
      ),
    );
  }

  @override
  void update({required OrderOperationNotification notification}) {
    switch (notification.notificationType) {
      case OrderNotificationType.ORDER_DELETED:
        add(
          _DeleteOrder(
            orderId: (notification as DeleteOrderNotification).orderId,
          ),
        );
        break;
      case OrderNotificationType.ORDER_UPDATED:
        add(
          _UpdateOrder(
            updatedOrder: (notification as UpdateOrderNotification).order,
          ),
        );
        break;
      case OrderNotificationType.ORDER_SEARCH_COMPLETE:
        add(
          _DisplaySearchOrderResult(
            result: (notification as SearchOrderCompleteNotification).result,
          ),
        );
        break;
      case OrderNotificationType.ORDER_SEARCH_CLEARED:
        add(_ClearSearchTerm());
        break;
      case OrderNotificationType.ORDER_CREATED:
        add(
          _AddOrder(
            addedOrder: (notification as NewOrderNotification).order,
          ),
        );
        break;
    }
  }

  @override
  String get id => _id;
}
