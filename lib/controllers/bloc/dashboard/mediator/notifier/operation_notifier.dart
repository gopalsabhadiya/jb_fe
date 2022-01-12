import 'package:jb_fe/controllers/bloc/dashboard/mediator/notification/notification.dart';
import 'package:jb_fe/controllers/bloc/dashboard/mediator/subscriber/operation_subscriber.dart';

abstract class DailyGoldRateOperationNotifier {
  void subscribe({required DailyGoldRateOperationSubscriber subscriber});

  void unSubscribe({required DailyGoldRateOperationSubscriber subscriber});

  void notifySubscriber(
      {required DailyGoldRateOperationNotification notification});
}
