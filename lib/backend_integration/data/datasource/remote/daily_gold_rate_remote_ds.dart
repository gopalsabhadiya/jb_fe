import 'dart:convert';

import 'package:jb_fe/backend_integration/client/http_client.dart';
import 'package:jb_fe/backend_integration/constants/uri/endpoints.dart';
import 'package:jb_fe/backend_integration/domain/entities/daily_gold_rate/daily_gold_rate.dart';

abstract class DailyGoldRateRemoteDataSource {
  Future<DailyGoldRateEntity> getTodayGoldRate();
  Future<DailyGoldRateEntity> addTodayGoldRate(
      DailyGoldRateEntity dailyGoldRate);
  Future<DailyGoldRateEntity> updateTodayGoldRate(
      DailyGoldRateEntity dailyGoldRate);
}

class DailyGoldRateRemoteDataSourceImpl extends DailyGoldRateRemoteDataSource {
  final _http = AppHttpClient.getHttpClient();

  @override
  Future<DailyGoldRateEntity> addTodayGoldRate(
      DailyGoldRateEntity dailyGoldRate) async {
    final response = await _http.post(
      EndpointUri.getCreateDailyGoldRateURL(),
      body: jsonEncode(dailyGoldRate.toJson()),
      headers: {
        "content-type": "application/json",
      },
    );
    return DailyGoldRateEntity.fromJson(jsonDecode(response.body));
  }

  @override
  Future<DailyGoldRateEntity> getTodayGoldRate() async {
    final response = await _http.get(
      EndpointUri.getGetTodayGoldRateURL(),
      headers: {
        "content-type": "application/json",
      },
    );
    return DailyGoldRateEntity.fromJson(jsonDecode(response.body));
  }

  @override
  Future<DailyGoldRateEntity> updateTodayGoldRate(
      DailyGoldRateEntity dailyGoldRate) async {
    final response = await _http.put(
      EndpointUri.getCreateDailyGoldRateURL(),
      body: jsonEncode(dailyGoldRate.toJson()),
      headers: {
        "content-type": "application/json",
      },
    );
    return DailyGoldRateEntity.fromJson(jsonDecode(response.body));
  }
}
