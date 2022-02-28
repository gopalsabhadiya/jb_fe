import 'dart:convert';

import 'package:jb_fe/backend_integration/client/http_client.dart';
import 'package:jb_fe/backend_integration/constants/uri/endpoints.dart';
import 'package:jb_fe/backend_integration/domain/entities/daily_gold_rate/daily_gold_rate.dart';

import '../../../../util/exceptions/app_exception.dart';
import '../../../../util/logger.dart';
import '../../../utils/header_utils.dart';

abstract class DailyGoldRateRemoteDataSource {
  Future<DailyGoldRateEntity> getTodayGoldRate();
  Future<DailyGoldRateEntity> addTodayGoldRate(
      DailyGoldRateEntity dailyGoldRate);
  Future<DailyGoldRateEntity> updateTodayGoldRate(
      DailyGoldRateEntity dailyGoldRate);
}

class DailyGoldRateRemoteDataSourceImpl extends DailyGoldRateRemoteDataSource {
  final log = getLogger<DailyGoldRateRemoteDataSourceImpl>();

  final _http = AppHttpClient.getHttpClient();

  @override
  Future<DailyGoldRateEntity> addTodayGoldRate(
      DailyGoldRateEntity dailyGoldRate) async {
    try {
      log.d("Trying to add daily gold rate: $dailyGoldRate");
      final response = await _http.post(
        EndpointUri.getCreateDailyGoldRateURL(),
        body: jsonEncode(dailyGoldRate.toJson()),
        headers: HeaderUtils.getHeader(),
      );
      return DailyGoldRateEntity.fromJson(jsonDecode(response.body));
    } on AppException {
      rethrow;
    } catch (e) {
      log.e(
        "Error while fetching response for: ${EndpointUri.getCreateDailyGoldRateURL()}",
      );
      log.e(e);
      rethrow;
    }
  }

  @override
  Future<DailyGoldRateEntity> getTodayGoldRate() async {
    try {
      log.d("Trying to get today's gold rate");
      final response = await _http.get(
        EndpointUri.getGetTodayGoldRateURL(),
        headers: HeaderUtils.getHeader(),
      );
      return DailyGoldRateEntity.fromJson(jsonDecode(response.body));
    } on AppException {
      rethrow;
    } catch (e) {
      log.e(
        "Error while fetching response for: ${EndpointUri.getGetTodayGoldRateURL()}",
      );
      log.e(e);
      rethrow;
    }
  }

  @override
  Future<DailyGoldRateEntity> updateTodayGoldRate(
      DailyGoldRateEntity dailyGoldRate) async {
    try {
      log.d("Trying to update daily gold rate: $dailyGoldRate");
      final response = await _http.put(
        EndpointUri.getCreateDailyGoldRateURL(),
        body: jsonEncode(dailyGoldRate.toJson()),
        headers: HeaderUtils.getHeader(),
      );
      return DailyGoldRateEntity.fromJson(jsonDecode(response.body));
    } on AppException {
      rethrow;
    } catch (e) {
      log.e(
        "Error while fetching response for: ${EndpointUri.getCreateDailyGoldRateURL()}",
      );
      log.e(e);
      rethrow;
    }
  }
}
