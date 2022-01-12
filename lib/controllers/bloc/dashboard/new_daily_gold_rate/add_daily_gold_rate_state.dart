part of 'add_daily_gold_rate_bloc.dart';

enum AddDailyGoldRateStatus { LOADING, COMPLETED, ERROR }

class AddDailyGoldRateState extends Equatable {
  final AddDailyGoldRateStatus status;
  const AddDailyGoldRateState({this.status = AddDailyGoldRateStatus.COMPLETED});

  @override
  List<Object> get props => [status];
}
