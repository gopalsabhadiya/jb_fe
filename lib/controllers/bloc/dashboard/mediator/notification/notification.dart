import 'package:equatable/equatable.dart';
import 'package:jb_fe/backend_integration/dto/daily_gold_rate/daily_gold_rate_presentation.dart';

enum DailyGoldRateNotificationType {
  DAILY_GOLD_RATE_UPDATED,
  DAILY_GOLD_RATE_CREATED,
}

class DailyGoldRateOperationNotification extends Equatable {
  final DailyGoldRateNotificationType notificationType;
  const DailyGoldRateOperationNotification({required this.notificationType});

  @override
  List<Object?> get props => [notificationType];
}

class NewDailyGoldRateNotification extends DailyGoldRateOperationNotification {
  final DailyGoldRatePresentation dailyGoldRate;

  const NewDailyGoldRateNotification({
    required this.dailyGoldRate,
  }) : super(
            notificationType:
                DailyGoldRateNotificationType.DAILY_GOLD_RATE_CREATED);

  @override
  List<Object> get props => [dailyGoldRate, notificationType];
}

class UpdateDailyGoldRateNotification
    extends DailyGoldRateOperationNotification {
  final DailyGoldRatePresentation dailyGoldRate;

  const UpdateDailyGoldRateNotification({
    required this.dailyGoldRate,
  }) : super(
            notificationType:
                DailyGoldRateNotificationType.DAILY_GOLD_RATE_UPDATED);

  @override
  List<Object> get props => [dailyGoldRate, notificationType];
}
