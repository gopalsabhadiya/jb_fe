import 'package:jb_fe/controllers/bloc/dashboard/mediator/notification/notification.dart';
import 'package:jb_fe/controllers/bloc/dashboard/mediator/subscriber/operation_subscriber.dart';

import 'operation_notifier.dart';

class UpdateDailyGoldRateNotifier implements DailyGoldRateOperationNotifier {
  final List<DailyGoldRateOperationSubscriber> _subscribers =
      <DailyGoldRateOperationSubscriber>[];

  @override
  void subscribe({required DailyGoldRateOperationSubscriber subscriber}) =>
      _subscribers.add(subscriber);

  @override
  void unSubscribe({required DailyGoldRateOperationSubscriber subscriber}) =>
      _subscribers.removeWhere((element) => element.id == subscriber.id);

  @override
  void notifySubscriber(
      {required DailyGoldRateOperationNotification notification}) {
    for (final subscriber in _subscribers) {
      subscriber.update(notification: notification);
    }
  }
}
