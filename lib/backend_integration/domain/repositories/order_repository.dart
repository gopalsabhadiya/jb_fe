import 'package:jb_fe/backend_integration/domain/entities/order/order.dart';

abstract class OrderRepository {
  Future<List<OrderEntity>> getOrderPage(int pageNumber);
  Future<OrderEntity> addOrder(OrderEntity item);
  Future<OrderEntity> updateOrder(OrderEntity order);
  Future<void> deleteOrder(String orderId);
  Future<List<OrderEntity>> searchOrder(String searchTerm, int skip);
}
