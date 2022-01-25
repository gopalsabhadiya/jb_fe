part of 'order_bloc.dart';

enum OrderStatus { INITIAL, LOADING, SUCCESS, FAILURE }

class OrderState extends Equatable {
  final OrderStatus status;
  final List<OrderDetailsPresentation> orderList;
  final bool hasReachedMax;
  final bool needToSearch;

  const OrderState({
    this.status = OrderStatus.INITIAL,
    this.orderList = const <OrderDetailsPresentation>[],
    this.hasReachedMax = false,
    this.needToSearch = false,
  });

  OrderState copyWith({
    OrderStatus? status,
    List<OrderDetailsPresentation>? orderList,
    bool? hasReachedMax,
    bool? needToSearch,
  }) {
    return OrderState(
        status: status ?? this.status,
        orderList: orderList ?? this.orderList,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax,
        needToSearch: needToSearch ?? this.needToSearch);
  }

  @override
  List<Object?> get props => [status, orderList, hasReachedMax, needToSearch];
}
