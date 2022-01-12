import 'package:jb_fe/controllers/bloc/dashboard/mediator/notification/notification.dart';

abstract class DailyGoldRateOperationSubscriber {
  String get id;
  void update({required DailyGoldRateOperationNotification notification});
}
