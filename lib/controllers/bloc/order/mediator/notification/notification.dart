import 'package:equatable/equatable.dart';
import 'package:jb_fe/backend_integration/dto/order/order_presentation.dart';

enum OrderNotificationType {
  ORDER_DELETED,
  ORDER_UPDATED,
  ORDER_CREATED,
  ORDER_ADD_REQUEST,
  ORDER_SEARCH_COMPLETE,
  ORDER_SEARCH_CLEARED,
  ORDER_GET_NEXT_PAGE
}

class OrderOperationNotification extends Equatable {
  final OrderNotificationType notificationType;
  const OrderOperationNotification({required this.notificationType});

  @override
  List<Object?> get props => [notificationType];
}

class DeleteOrderNotification extends OrderOperationNotification {
  final String orderId;

  const DeleteOrderNotification({
    required this.orderId,
  }) : super(notificationType: OrderNotificationType.ORDER_DELETED);

  @override
  List<Object> get props => [orderId, notificationType];
}

class NewOrderNotification extends OrderOperationNotification {
  final OrderPresentation order;

  const NewOrderNotification({
    required this.order,
  }) : super(notificationType: OrderNotificationType.ORDER_CREATED);

  @override
  List<Object> get props => [order, notificationType];
}

class UpdateOrderNotification extends OrderOperationNotification {
  final OrderPresentation order;

  const UpdateOrderNotification({
    required this.order,
  }) : super(notificationType: OrderNotificationType.ORDER_UPDATED);

  @override
  List<Object> get props => [order, notificationType];
}

class SearchOrderCompleteNotification extends OrderOperationNotification {
  final List<OrderPresentation> result;
  final String searchTerm;
  const SearchOrderCompleteNotification(
      {required this.result, required this.searchTerm})
      : super(notificationType: OrderNotificationType.ORDER_SEARCH_COMPLETE);

  @override
  List<Object> get props => [result, notificationType];
}

class SearchOrderTermClearedNotification extends OrderOperationNotification {
  const SearchOrderTermClearedNotification()
      : super(notificationType: OrderNotificationType.ORDER_SEARCH_CLEARED);
}

class SearchNextOrderPageRequestNotification
    extends OrderOperationNotification {
  const SearchNextOrderPageRequestNotification()
      : super(notificationType: OrderNotificationType.ORDER_GET_NEXT_PAGE);
}

class AddOrderRequestNotification extends OrderOperationNotification {
  const AddOrderRequestNotification()
      : super(notificationType: OrderNotificationType.ORDER_ADD_REQUEST);
}
