import 'package:jb_fe/backend_integration/data/datasource/remote/order_remote_ds.dart';
import 'package:jb_fe/backend_integration/domain/entities/order/details/order_details.dart';
import 'package:jb_fe/backend_integration/domain/entities/order/order.dart';
import 'package:jb_fe/backend_integration/domain/repositories/order_repository.dart';

class OrderRepositoryImpl implements OrderRepository {
  final OrderRemoteDataSource remoteDataSource;

  OrderRepositoryImpl({required this.remoteDataSource});

  @override
  Future<OrderEntity> addOrder(OrderEntity order) async {
    return await remoteDataSource.addOrder(order);
  }

  @override
  Future<void> deleteOrder(String orderId) async {
    return await remoteDataSource.deleteOrder(orderId);
  }

  @override
  Future<List<OrderDetailsEntity>> getOrderPage(int skip) async {
    return await remoteDataSource.getOrderPage(skip);
  }

  @override
  Future<List<OrderDetailsEntity>> searchOrder(
      String searchTerm, int skip) async {
    return await remoteDataSource.searchOrder(searchTerm, skip);
  }

  @override
  Future<OrderEntity> fetchOrder(String orderId) async {
    return await remoteDataSource.fetchOrder(orderId);
  }

  @override
  Future<List<OrderEntity>> fetchOrderBatch(List<String> orderIdList) async {
    return await remoteDataSource.fetchOrderBatch(orderIdList);
  }

  @override
  Future<List<OrderEntity>> fetchUnpaidOrders(String partyId) async {
    return await remoteDataSource.fetchUnpaidOrders(partyId);
  }
}
