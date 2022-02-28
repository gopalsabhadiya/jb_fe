import 'dart:convert';

import 'package:jb_fe/backend_integration/client/http_client.dart';
import 'package:jb_fe/backend_integration/constants/uri/endpoints.dart';
import 'package:jb_fe/backend_integration/domain/entities/business/business.dart';

import '../../../../util/logger.dart';

abstract class BusinessRemoteDataSource {
  Future<BusinessEntity> getBusinessData();

  Future<BusinessEntity> updateParty(BusinessEntity business);
}

class BusinessRemoteDataSourceImpl implements BusinessRemoteDataSource {
  final log = getLogger<BusinessRemoteDataSourceImpl>();

  final _http = AppHttpClient.getHttpClient();

  @override
  Future<BusinessEntity> getBusinessData() async {
    final response = await _http.get(
      EndpointUri.getGetBusinessURL(),
      headers: {
        "content-type": "application/json",
      },
    );
    final BusinessEntity entity =
        BusinessEntity.fromJson(jsonDecode(response.body));
    return entity;
  }

  @override
  Future<BusinessEntity> updateParty(BusinessEntity business) async {
    final response = await _http.put(
      EndpointUri.getUpdateBusinessURL(),
      body: jsonEncode(business.toJson()),
      headers: {
        "content-type": "application/json",
      },
    );
    return BusinessEntity.fromJson(jsonDecode(response.body));
  }
}
