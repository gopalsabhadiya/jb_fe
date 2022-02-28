import 'dart:convert';

import 'package:jb_fe/backend_integration/client/http_client.dart';
import 'package:jb_fe/backend_integration/constants/uri/endpoints.dart';
import 'package:jb_fe/backend_integration/domain/entities/business/business.dart';

import '../../../../util/exceptions/app_exception.dart';
import '../../../../util/logger.dart';
import '../../../utils/header_utils.dart';

abstract class BusinessRemoteDataSource {
  Future<BusinessEntity> getBusinessData();

  Future<BusinessEntity> updateBusiness(BusinessEntity business);
}

class BusinessRemoteDataSourceImpl implements BusinessRemoteDataSource {
  final log = getLogger<BusinessRemoteDataSourceImpl>();

  final _http = AppHttpClient.getHttpClient();

  @override
  Future<BusinessEntity> getBusinessData() async {
    try {
      log.d("Trying to get business data");
      final response = await _http.get(
        EndpointUri.getGetBusinessURL(),
        headers: HeaderUtils.getHeader(),
      );
      final BusinessEntity entity =
          BusinessEntity.fromJson(jsonDecode(response.body));
      return entity;
    } on AppException {
      rethrow;
    } catch (e) {
      log.e(
        "Error while fetching response for: ${EndpointUri.getGetBusinessURL()}",
      );
      log.e(e);
      rethrow;
    }
  }

  @override
  Future<BusinessEntity> updateBusiness(BusinessEntity business) async {
    try {
      log.d("Trying to Update Business: ${business.toString()}");
      final response = await _http.put(
        EndpointUri.getUpdateBusinessURL(),
        body: jsonEncode(business.toJson()),
        headers: HeaderUtils.getHeader(),
      );
      return BusinessEntity.fromJson(jsonDecode(response.body));
    } on AppException {
      rethrow;
    } catch (e) {
      log.e(
        "Error while fetching response for: ${EndpointUri.getUpdateBusinessURL()}",
      );
      log.e(e);
      rethrow;
    }
  }
}
