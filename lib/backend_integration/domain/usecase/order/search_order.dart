import 'package:jb_fe/backend_integration/domain/entities/order/details/order_details.dart';
import 'package:jb_fe/backend_integration/domain/repositories/order_repository.dart';
import 'package:jb_fe/backend_integration/dto/order/details/order_details_presentation.dart';

class SearchOrderUseCase {
  final OrderRepository repository;

  SearchOrderUseCase({required this.repository});

  Future<List<OrderDetailsPresentation>> call({
    required String searchTerm,
    int skip = 0,
  }) async {
    List<OrderDetailsEntity> orderEntityList =
        await repository.searchOrder(searchTerm, skip);

    List<OrderDetailsPresentation> orderPresentationList = orderEntityList
        .map((order) => OrderDetailsPresentation(order))
        .toList();

    return orderPresentationList;
  }
}
