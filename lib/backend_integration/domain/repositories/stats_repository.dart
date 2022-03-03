import '../entities/stats/business/business_stats.dart';

abstract class StatsRepository {
  Future<BusinessStatsEntity> getBusinessStats();
}
