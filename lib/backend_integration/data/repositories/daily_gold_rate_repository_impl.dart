import 'package:jb_fe/backend_integration/data/datasource/remote/daily_gold_rate_remote_ds.dart';
import 'package:jb_fe/backend_integration/domain/entities/daily_gold_rate/daily_gold_rate.dart';
import 'package:jb_fe/backend_integration/domain/repositories/daily_gold_rate_repository.dart';

class DailyGoldRateRepositoryImpl extends DailyGoldRateRepository {
  final DailyGoldRateRemoteDataSource remoteDataSource;

  DailyGoldRateRepositoryImpl({required this.remoteDataSource});

  @override
  Future<DailyGoldRateEntity> addTodayGoldRate(
      DailyGoldRateEntity dailyGoldRate) async {
    return await remoteDataSource.addTodayGoldRate(dailyGoldRate);
  }

  @override
  Future<DailyGoldRateEntity> getTodayGoldRate() async {
    return await remoteDataSource.getTodayGoldRate();
  }

  @override
  Future<DailyGoldRateEntity> updateTodayGoldRate(
      DailyGoldRateEntity dailyGoldRate) async {
    return await remoteDataSource.updateTodayGoldRate(dailyGoldRate);
  }
}
