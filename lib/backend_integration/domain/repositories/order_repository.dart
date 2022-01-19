import 'package:jb_fe/backend_integration/domain/entities/order/order.dart';

abstract class OrderRepository {
  Future<OrderEntity> addOrder(OrderEntity item);
}
