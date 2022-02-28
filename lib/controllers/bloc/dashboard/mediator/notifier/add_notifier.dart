import 'package:jb_fe/controllers/bloc/dashboard/mediator/notification/notification.dart';
import 'package:jb_fe/controllers/bloc/dashboard/mediator/subscriber/operation_subscriber.dart';
import 'package:jb_fe/util/extension/common_logging.dart';

import '../../../../../util/logger.dart';
import 'operation_notifier.dart';

class AddDailyGoldRateNotifier implements DailyGoldRateOperationNotifier {
  final log = getLogger<AddDailyGoldRateNotifier>();

  final List<DailyGoldRateOperationSubscriber> _subscribers =
      <DailyGoldRateOperationSubscriber>[];

  @override
  void subscribe({required DailyGoldRateOperationSubscriber subscriber}) {
    log.logBlocEventSubscriptionAdded(subscriberType: subscriber.runtimeType);

    _subscribers.add(subscriber);
  }

  @override
  void unSubscribe({required DailyGoldRateOperationSubscriber subscriber}) {
    log.logBlocEventSubscriptionRemoved(subscriberType: subscriber.runtimeType);

    _subscribers.removeWhere((element) => element.id == subscriber.id);
  }

  @override
  void notifySubscriber(
      {required DailyGoldRateOperationNotification notification}) {
    for (final subscriber in _subscribers) {
      log.logEventNotification(
        subscriberType: subscriber.runtimeType,
        notificationType: notification.runtimeType,
      );
      subscriber.update(notification: notification);
    }
  }
}
