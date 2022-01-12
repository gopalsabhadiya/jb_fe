part of 'update_daily_gold_rate_bloc.dart';

abstract class UpdateDailyGoldRateEvent extends Equatable {
  const UpdateDailyGoldRateEvent();
}

class UpdateDailyGoldRate extends UpdateDailyGoldRateEvent {
  final DailyGoldRatePresentation dailyGoldRate;

  const UpdateDailyGoldRate({required this.dailyGoldRate});

  @override
  List<Object?> get props => [dailyGoldRate];
}
