part of 'daily_gold_rate_bloc.dart';

enum DailyGoldRateStatus { LOADING, COMPLETED, ERROR }

class DailyGoldRateState extends Equatable {
  final DailyGoldRateStatus status;
  final bool todayGoldRateAvailable;
  final DailyGoldRatePresentation? todayGoldRate;

  const DailyGoldRateState({
    this.status = DailyGoldRateStatus.COMPLETED,
    this.todayGoldRateAvailable = false,
    this.todayGoldRate,
  });

  DailyGoldRateState copyWith({
    DailyGoldRateStatus? status,
    DailyGoldRatePresentation? todayGoldRate,
    bool? todayGoldRateAvailable,
  }) {
    return DailyGoldRateState(
      status: status ?? this.status,
      todayGoldRate: todayGoldRate ?? this.todayGoldRate,
      todayGoldRateAvailable:
          todayGoldRateAvailable ?? this.todayGoldRateAvailable,
    );
  }

  @override
  List<Object?> get props => [status, todayGoldRateAvailable, todayGoldRate];
}
