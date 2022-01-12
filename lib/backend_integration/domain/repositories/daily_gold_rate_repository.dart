import 'package:jb_fe/backend_integration/domain/entities/daily_gold_rate/daily_gold_rate.dart';

abstract class DailyGoldRateRepository {
  Future<DailyGoldRateEntity> getTodayGoldRate();
  Future<DailyGoldRateEntity> addTodayGoldRate(
      DailyGoldRateEntity dailyGoldRate);
  Future<DailyGoldRateEntity> updateTodayGoldRate(
      DailyGoldRateEntity dailyGoldRate);
}
