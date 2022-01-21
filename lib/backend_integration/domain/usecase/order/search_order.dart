import 'package:jb_fe/backend_integration/domain/entities/order/order.dart';
import 'package:jb_fe/backend_integration/domain/repositories/order_repository.dart';
import 'package:jb_fe/backend_integration/dto/order/order_presentation.dart';

class SearchOrderUseCase {
  final OrderRepository repository;

  SearchOrderUseCase({required this.repository});

  Future<List<OrderPresentation>> call({
    required String searchTerm,
    int skip = 0,
  }) async {
    List<OrderEntity> orderEntityList =
        await repository.searchOrder(searchTerm, skip);

    List<OrderPresentation> orderPresentationList =
        orderEntityList.map((order) => OrderPresentation(order)).toList();

    return orderPresentationList;
  }
}
