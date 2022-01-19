import 'dart:convert';

import 'package:jb_fe/backend_integration/client/http_client.dart';
import 'package:jb_fe/backend_integration/constants/uri/endpoints.dart';
import 'package:jb_fe/backend_integration/domain/entities/order/order.dart';

abstract class OrderRemoteDataSource {
  Future<OrderEntity> addOrder(OrderEntity order);
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
    print(
        "Response: ----------------------------------------------------------------");
    print(response.body);
    return OrderEntity.fromJson(jsonDecode(response.body));
  }
}
