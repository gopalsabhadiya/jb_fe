import 'package:jb_fe/backend_integration/domain/repositories/order_repository.dart';
import 'package:jb_fe/backend_integration/dto/order/order_presentation.dart';

class CreateOrderUseCase {
  final OrderRepository repository;

  CreateOrderUseCase({required this.repository});

  Future<OrderPresentation> call({required OrderPresentation order}) async {
    print("Saving order: ${order}");
    print("OrderEntity: ${order.getEntity()}");

    final orderEntity = await repository.addOrder(order.getEntity());
    // launch("https://play.google.com/store/search?q=pub%3ABAPPA%20SAIKH&c=apps");
    return OrderPresentation(orderEntity);
  }
}
