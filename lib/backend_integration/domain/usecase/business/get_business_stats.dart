import 'package:jb_fe/backend_integration/domain/entities/stats/business/business_stats.dart';
import 'package:jb_fe/backend_integration/domain/repositories/stats_repository.dart';

class GetBusinessStatsUseCase {
  final StatsRepository repository;

  GetBusinessStatsUseCase({required this.repository});

  Future<BusinessStatsEntity> call() async {
    return await repository.getBusinessStats();
  }
}
