import 'package:jb_fe/controllers/bloc/order/mediator/notification/notification.dart';
import 'package:jb_fe/controllers/bloc/order/mediator/notifier/operation_notifier.dart';
import 'package:jb_fe/controllers/bloc/order/mediator/subscriber/operation_subscriber.dart';
import 'package:jb_fe/util/extension/common_logging.dart';

import '../../../../../util/logger.dart';

class UpdateOrderNotifier implements OrderOperationNotifier {
  final log = getLogger<UpdateOrderNotifier>();

  final List<OrderOperationSubscriber> _subscribers =
      <OrderOperationSubscriber>[];

  @override
  void subscribe({required OrderOperationSubscriber subscriber}) {
    log.logBlocEventSubscriptionAdded(subscriberType: subscriber.runtimeType);
    _subscribers.add(subscriber);
  }

  @override
  void unSubscribe({required OrderOperationSubscriber subscriber}) {
    log.logBlocEventSubscriptionRemoved(subscriberType: subscriber.runtimeType);
    _subscribers.removeWhere((element) => element.id == subscriber.id);
  }

  @override
  void notifySubscriber({required OrderOperationNotification notification}) {
    for (final subscriber in _subscribers) {
      log.logEventNotification(
        subscriberType: subscriber.runtimeType,
        notificationType: notification.runtimeType,
      );
      subscriber.update(notification: notification);
    }
  }
}
