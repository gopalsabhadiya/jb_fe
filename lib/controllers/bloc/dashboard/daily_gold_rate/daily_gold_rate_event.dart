part of 'daily_gold_rate_bloc.dart';

abstract class DailyGoldRateEvent extends Equatable {
  const DailyGoldRateEvent();
}

class GetTodayGoldRate extends DailyGoldRateEvent {
  @override
  List<Object?> get props => [];
}
