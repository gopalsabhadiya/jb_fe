import 'package:jb_fe/backend_integration/data/datasource/remote/order_remote_ds.dart';
import 'package:jb_fe/backend_integration/domain/entities/order/order.dart';
import 'package:jb_fe/backend_integration/domain/repositories/order_repository.dart';

class OrderRepositoryImpl implements OrderRepository {
  final OrderRemoteDataSource remoteDataSource;

  OrderRepositoryImpl({required this.remoteDataSource});

  @override
  Future<OrderEntity> addOrder(OrderEntity order) async {
    return await remoteDataSource.addOrder(order);
  }
}
