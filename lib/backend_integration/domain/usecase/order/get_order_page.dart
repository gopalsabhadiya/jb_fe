import 'package:jb_fe/backend_integration/domain/entities/order/details/order_details.dart';
import 'package:jb_fe/backend_integration/domain/entities/order/order.dart';
import 'package:jb_fe/backend_integration/domain/repositories/order_repository.dart';
import 'package:jb_fe/backend_integration/dto/order/details/order_details_presentation.dart';
import 'package:jb_fe/backend_integration/dto/order/order_presentation.dart';

class GetOrderPageUseCase {
  final OrderRepository repository;

  GetOrderPageUseCase({required this.repository});

  Future<List<OrderDetailsPresentation>> call({int skip = 0}) async {
    List<OrderDetailsEntity> orderEntityList =
        await repository.getOrderPage(skip);
    List<OrderDetailsPresentation> orderPresentationList = orderEntityList
        .map((order) => OrderDetailsPresentation(order))
        .toList();
    return orderPresentationList;
  }
}
