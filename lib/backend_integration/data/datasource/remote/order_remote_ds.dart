import 'dart:convert';

import 'package:jb_fe/backend_integration/client/http_client.dart';
import 'package:jb_fe/backend_integration/constants/uri/endpoints.dart';
import 'package:jb_fe/backend_integration/domain/entities/order/details/order_details.dart';
import 'package:jb_fe/backend_integration/domain/entities/order/order.dart';

abstract class OrderRemoteDataSource {
  Future<OrderEntity> addOrder(OrderEntity order);
  Future<List<OrderDetailsEntity>> getOrderPage(int skip);
  Future<List<OrderDetailsEntity>> searchOrder(String searchTerm, int skip);
  Future<void> deleteOrder(String orderId);

  Future<OrderEntity> fetchOrder(String orderId);

  Future<List<OrderEntity>> fetchOrderBatch(List<String> orderIdList);
}

class OrderRemoteDataSourceImpl implements OrderRemoteDataSource {
  final _http = AppHttpClient.getHttpClient();

  @override
  Future<OrderEntity> addOrder(OrderEntity order) async {
    final response = await _http.post(
      EndpointUri.getAddOrderURL(),
      body: jsonEncode(order.toJson()),
      headers: {
        "content-type": "application/json",
      },
    );
    print(response.body);
    return OrderEntity.fromJson(jsonDecode(response.body));
  }

  @override
  Future<List<OrderDetailsEntity>> getOrderPage(int skip) async {
    final response = await _http.get(
      EndpointUri.getOrderPageURL(skip),
      headers: {
        "content-type": "application/json",
      },
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
      headers: {
        "content-type": "application/json",
      },
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
        headers: {"content-type": "application/json"},
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
      headers: {
        "content-type": "application/json",
      },
    );

    print("Response: ${response.statusCode} ${response.body}");
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
      headers: {
        "content-type": "application/json",
      },
    );
    List<OrderEntity> orderBatch =
        OrderEntity.fromJsonToList(json.decode(response.body));
    // print("Your parties: $partyPage");
    return orderBatch;
  }
}
