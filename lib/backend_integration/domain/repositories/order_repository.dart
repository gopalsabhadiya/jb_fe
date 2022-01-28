import 'package:jb_fe/backend_integration/domain/entities/order/details/order_details.dart';
import 'package:jb_fe/backend_integration/domain/entities/order/order.dart';

abstract class OrderRepository {
  Future<List<OrderDetailsEntity>> getOrderPage(int pageNumber);
  Future<OrderEntity> addOrder(OrderEntity item);
  Future<void> deleteOrder(String orderId);
  Future<List<OrderDetailsEntity>> searchOrder(String searchTerm, int skip);
  Future<OrderEntity> fetchOrder(String orderId);
  Future<List<OrderEntity>> fetchOrderBatch(List<String> orderIdList);
}
