import 'package:jb_fe/backend_integration/domain/entities/order/order.dart';
import 'package:jb_fe/backend_integration/domain/repositories/order_repository.dart';
import 'package:jb_fe/backend_integration/dto/order/order_presentation.dart';

class GetOrderPageUseCase {
  final OrderRepository repository;

  GetOrderPageUseCase({required this.repository});

  Future<List<OrderPresentation>> call({int skip = 0}) async {
    List<OrderEntity> orderEntityList = await repository.getOrderPage(skip);
    List<OrderPresentation> orderPresentationList =
        orderEntityList.map((order) => OrderPresentation(order)).toList();
    return orderPresentationList;
  }
}
