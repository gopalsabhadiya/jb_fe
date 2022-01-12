import 'package:jb_fe/backend_integration/domain/repositories/daily_gold_rate_repository.dart';
import 'package:jb_fe/backend_integration/dto/daily_gold_rate/daily_gold_rate_presentation.dart';

class CreateDailyGoldRateUseCase {
  final DailyGoldRateRepository repository;

  CreateDailyGoldRateUseCase({required this.repository});

  Future<DailyGoldRatePresentation> call(
      {required DailyGoldRatePresentation dailyGoldRate}) async {
    dailyGoldRate.updateValues();

    final dailyGoldRateEntity =
        await repository.addTodayGoldRate(dailyGoldRate.getEntity());
    return DailyGoldRatePresentation(dailyGoldRateEntity);
  }
}
