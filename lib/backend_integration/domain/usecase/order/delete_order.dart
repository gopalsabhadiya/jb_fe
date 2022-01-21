import 'package:jb_fe/backend_integration/domain/repositories/order_repository.dart';

class DeleteOrderUseCase {
  final OrderRepository repository;

  DeleteOrderUseCase({required this.repository});

  Future<void> call({required String orderId}) async {
    return await repository.deleteOrder(orderId);
  }
}
