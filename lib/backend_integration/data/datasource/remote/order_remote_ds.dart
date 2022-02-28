import 'dart:convert';

import 'package:jb_fe/backend_integration/client/http_client.dart';
import 'package:jb_fe/backend_integration/constants/uri/endpoints.dart';
import 'package:jb_fe/backend_integration/domain/entities/order/details/order_details.dart';
import 'package:jb_fe/backend_integration/domain/entities/order/order.dart';

import '../../../../util/logger.dart';
import '../../../utils/header_utils.dart';

abstract class OrderRemoteDataSource {
  Future<OrderEntity> addOrder(OrderEntity order);
  Future<List<OrderDetailsEntity>> getOrderPage(int skip);
  Future<List<OrderDetailsEntity>> searchOrder(String searchTerm, int skip);
  Future<void> deleteOrder(String orderId);

  Future<OrderEntity> fetchOrder(String orderId);

  Future<List<OrderEntity>> fetchOrderBatch(List<String> orderIdList);

  Future<List<OrderEntity>> fetchUnpaidOrders(String partyId);
}

class OrderRemoteDataSourceImpl implements OrderRemoteDataSource {
  final log = getLogger<OrderRemoteDataSourceImpl>();

  final _http = AppHttpClient.getHttpClient();

  @override
  Future<OrderEntity> addOrder(OrderEntity order) async {
    final response = await _http.post(
      EndpointUri.getAddOrderURL(),
      body: jsonEncode(order.toJson()),
      headers: HeaderUtils.getHeader(),
    );
    print(response.body);
    return OrderEntity.fromJson(jsonDecode(response.body));
  }

  @override
  Future<List<OrderDetailsEntity>> getOrderPage(int skip) async {
    final response = await _http.get(
      EndpointUri.getOrderPageURL(skip),
      headers: HeaderUtils.getHeader(),
    );
    List<OrderDetailsEntity> orderPage = OrderDetailsEntity.fromJsonToList(
      json.decode(response.body),
    );
    return orderPage;
  }

  @override
  Future<List<OrderDetailsEntity>> searchOrder(
      String searchTerm, int skip) async {
    final response = await _http.get(
      EndpointUri.getSearchOrderURL(skip, searchTerm),
      headers: HeaderUtils.getHeader(),
    );
    List<OrderDetailsEntity> orderPage =
        OrderDetailsEntity.fromJsonToList(json.decode(response.body));
    // print("Your parties: $partyPage");
    return orderPage;
  }

  @override
  Future<void> deleteOrder(String orderId) async {
    try {
      final response = await _http.delete(
        EndpointUri.getDeleteOrderURL(orderId),
        headers: HeaderUtils.getHeader(),
      );
    } catch (e) {
      print("Exception");
    }
  }

  @override
  Future<OrderEntity> fetchOrder(String orderId) async {
    print("Fetching order: $orderId");
    final response = await _http.get(
      EndpointUri.getOrderByIdURL(orderId),
      headers: HeaderUtils.getHeader(),
    );

    OrderEntity order = OrderEntity.fromJson(
      json.decode(response.body),
    );
    return order;
  }

  @override
  Future<List<OrderEntity>> fetchOrderBatch(List<String> orderIdList) async {
    final response = await _http.post(
      EndpointUri.getOrderBatchByIdURL(),
      body: jsonEncode(orderIdList),
      headers: HeaderUtils.getHeader(),
    );
    List<OrderEntity> orderBatch =
        OrderEntity.fromJsonToList(json.decode(response.body));
    // print("Your parties: $partyPage");
    return orderBatch;
  }

  @override
  Future<List<OrderEntity>> fetchUnpaidOrders(String partyId) async {
    final Map<String, String> payload = {"partyId": partyId};
    final response = await _http.post(
      EndpointUri.getUnpaidOrdersURL(),
      body: jsonEncode(payload),
      headers: HeaderUtils.getHeader(),
    );
    // print("Response: ${response.statusCode} ${json.decode(response.body)}");
    List<OrderEntity> orderBatch =
        OrderEntity.fromJsonToList(json.decode(response.body));
    print("Your orders: $orderBatch");
    return orderBatch;
  }
}
