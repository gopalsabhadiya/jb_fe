part of 'update_daily_gold_rate_bloc.dart';

enum UpdateDailyGoldRateStatus { LOADING, COMPLETED, ERROR }

class UpdateDailyGoldRateState extends Equatable {
  final UpdateDailyGoldRateStatus status;
  const UpdateDailyGoldRateState(
      {this.status = UpdateDailyGoldRateStatus.COMPLETED});

  @override
  List<Object> get props => [status];
}
