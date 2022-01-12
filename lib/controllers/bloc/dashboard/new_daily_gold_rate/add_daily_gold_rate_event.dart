part of 'add_daily_gold_rate_bloc.dart';

abstract class AddDailyGoldRateEvent extends Equatable {
  const AddDailyGoldRateEvent();
}

class AddDailyGoldRate extends AddDailyGoldRateEvent {
  final DailyGoldRatePresentation dailyGoldRate;

  const AddDailyGoldRate({required this.dailyGoldRate});

  @override
  List<Object?> get props => [dailyGoldRate];
}
