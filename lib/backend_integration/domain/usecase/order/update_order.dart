import 'package:jb_fe/backend_integration/domain/entities/order/order.dart';
import 'package:jb_fe/backend_integration/domain/repositories/order_repository.dart';
import 'package:jb_fe/backend_integration/dto/order/order_presentation.dart';

class UpdateOrderUseCase {
  final OrderRepository repository;

  UpdateOrderUseCase({required this.repository});

  Future<OrderPresentation> call({required OrderPresentation order}) async {
    // order.updateValues();
    final OrderEntity entity = await repository.updateOrder(order.getEntity());
    return OrderPresentation(entity);
  }
}
