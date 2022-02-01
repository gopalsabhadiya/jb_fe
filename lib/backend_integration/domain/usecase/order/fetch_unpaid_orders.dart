import 'package:jb_fe/backend_integration/domain/repositories/order_repository.dart';
import 'package:jb_fe/backend_integration/dto/order/order_presentation.dart';

class FetchUnpaidOrdersUseCase {
  final OrderRepository repository;

  FetchUnpaidOrdersUseCase({required this.repository});

  Future<List<OrderPresentation>> call({required String partyId}) async {
    final orderEntityList = await repository.fetchUnpaidOrders(partyId);
    List<OrderPresentation> orderPresentationList =
        orderEntityList.map((order) => OrderPresentation(order)).toList();
    return orderPresentationList;
  }
}
