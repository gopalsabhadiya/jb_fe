import 'package:jb_fe/backend_integration/data/datasource/remote/order_remote_ds.dart';
import 'package:jb_fe/backend_integration/domain/entities/order/details/order_details.dart';
import 'package:jb_fe/backend_integration/domain/entities/order/order.dart';
import 'package:jb_fe/backend_integration/domain/repositories/order_repository.dart';

import '../../../util/logger.dart';

class OrderRepositoryImpl implements OrderRepository {
  final log = getLogger<OrderRepositoryImpl>();

  final OrderRemoteDataSource remoteDataSource;

  OrderRepositoryImpl({required this.remoteDataSource});

  @override
  Future<OrderEntity> addOrder(OrderEntity order) async {
    log.d("Adding order");
    return await remoteDataSource.addOrder(order);
  }

  @override
  Future<void> deleteOrder(String orderId) async {
    log.d("Deleting Order");
    return await remoteDataSource.deleteOrder(orderId);
  }

  @override
  Future<List<OrderDetailsEntity>> getOrderPage(int skip) async {
    log.d("Fetching order page");
    return await remoteDataSource.getOrderPage(skip);
  }

  @override
  Future<List<OrderDetailsEntity>> searchOrder(
      String searchTerm, int skip) async {
    log.d("Searching Order");
    return await remoteDataSource.searchOrder(searchTerm, skip);
  }

  @override
  Future<OrderEntity> fetchOrder(String orderId) async {
    log.d("Fetching Order");
    return await remoteDataSource.fetchOrder(orderId);
  }

  @override
  Future<List<OrderEntity>> fetchOrderBatch(List<String> orderIdList) async {
    log.d("Fetching order batch");
    return await remoteDataSource.fetchOrderBatch(orderIdList);
  }

  @override
  Future<List<OrderEntity>> fetchUnpaidOrders(String partyId) async {
    log.d("Fetching unpaid order");
    return await remoteDataSource.fetchUnpaidOrders(partyId);
  }
}
