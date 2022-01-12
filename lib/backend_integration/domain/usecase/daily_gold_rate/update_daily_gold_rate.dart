import 'package:jb_fe/backend_integration/domain/repositories/daily_gold_rate_repository.dart';
import 'package:jb_fe/backend_integration/dto/daily_gold_rate/daily_gold_rate_presentation.dart';

class UpdateTodayGoldRateUseCase {
  final DailyGoldRateRepository repository;

  UpdateTodayGoldRateUseCase({required this.repository});

  Future<DailyGoldRatePresentation> call(
      {required DailyGoldRatePresentation dailyGoldRate}) async {
    dailyGoldRate.updateValues();
    print("Update daily gold rate: $dailyGoldRate");
    final dailyGoldRateEntity =
        await repository.updateTodayGoldRate(dailyGoldRate.getEntity());
    return DailyGoldRatePresentation(dailyGoldRateEntity);
  }
}
