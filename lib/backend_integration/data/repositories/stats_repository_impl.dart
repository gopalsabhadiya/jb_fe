import 'package:jb_fe/backend_integration/domain/entities/stats/business/business_stats.dart';

import '../../../util/logger.dart';
import '../../domain/repositories/stats_repository.dart';
import '../datasource/remote/stats_remote_ds.dart';

class StatsRepositoryImpl implements StatsRepository {
  final log = getLogger<StatsRepositoryImpl>();

  final StatsRemoteDataSource remoteDataSource;

  StatsRepositoryImpl({required this.remoteDataSource});

  @override
  Future<BusinessStatsEntity> getBusinessStats() {
    return remoteDataSource.getBusinessStats();
  }
}
