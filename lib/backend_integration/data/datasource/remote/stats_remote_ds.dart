import 'dart:convert';

import 'package:jb_fe/backend_integration/client/http_client.dart';
import 'package:jb_fe/backend_integration/domain/entities/stats/business/business_stats.dart';

import '../../../../util/exceptions/app_exception.dart';
import '../../../../util/logger.dart';
import '../../../constants/uri/endpoints.dart';
import '../../../utils/header_utils.dart';

abstract class StatsRemoteDataSource {
  Future<BusinessStatsEntity> getBusinessStats();
}

class StatsRemoteDataSourceImpl implements StatsRemoteDataSource {
  final log = getLogger<StatsRemoteDataSourceImpl>();

  final _http = AppHttpClient.getHttpClient();

  @override
  Future<BusinessStatsEntity> getBusinessStats() async {
    try {
      final response = await _http.get(
        EndpointUri.getGetBusinessStatsURL(),
        headers: HeaderUtils.getHeader(),
      );
      BusinessStatsEntity businessStatsEntity = BusinessStatsEntity.fromJson(
        json.decode(response.body),
      );
      return businessStatsEntity;
    } on AppException {
      rethrow;
    } catch (e) {
      log.e(
        "Error while fetching response for: ${EndpointUri.getGetUserURL()}",
      );
      log.e(e);
      rethrow;
    }
  }
}
