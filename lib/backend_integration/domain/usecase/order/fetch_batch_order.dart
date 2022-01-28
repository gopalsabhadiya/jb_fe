import 'package:jb_fe/backend_integration/domain/entities/order/order.dart';
import 'package:jb_fe/backend_integration/domain/repositories/order_repository.dart';
import 'package:jb_fe/backend_integration/dto/order/order_presentation.dart';

class FetchOrderBatchUseCase {
  final OrderRepository repository;

  FetchOrderBatchUseCase({required this.repository});

  Future<List<OrderPresentation>> call(
      {required List<String> orderIdList}) async {
    List<OrderEntity> orderEntityList =
        await repository.fetchOrderBatch(orderIdList);
    List<OrderPresentation> orderPresentationList =
        orderEntityList.map((order) => OrderPresentation(order)).toList();
    return orderPresentationList;
  }
}
