import 'package:jb_fe/backend_integration/domain/repositories/order_repository.dart';
import 'package:jb_fe/backend_integration/dto/order/order_presentation.dart';

class FetchOrderUseCase {
  final OrderRepository repository;

  FetchOrderUseCase({required this.repository});

  Future<OrderPresentation> call({required String orderId}) async {
    final orderEntity = await repository.fetchOrder(orderId);
    return OrderPresentation(orderEntity);
  }
}
