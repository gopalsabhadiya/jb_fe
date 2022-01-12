import 'package:jb_fe/backend_integration/domain/repositories/daily_gold_rate_repository.dart';
import 'package:jb_fe/backend_integration/dto/daily_gold_rate/daily_gold_rate_presentation.dart';

class GetTodayGoldRateUseCase {
  final DailyGoldRateRepository repository;

  GetTodayGoldRateUseCase({required this.repository});

  Future<DailyGoldRatePresentation> call() async {
    final dailyGoldRateEntity = await repository.getTodayGoldRate();
    return DailyGoldRatePresentation(dailyGoldRateEntity);
  }
}
