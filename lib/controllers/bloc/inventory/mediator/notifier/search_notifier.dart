import 'package:jb_fe/controllers/bloc/inventory/mediator/notification/notification.dart';
import 'package:jb_fe/controllers/bloc/inventory/mediator/subscriber/operation_subscriber.dart';
import 'package:jb_fe/util/extension/common_logging.dart';

import '../../../../../util/logger.dart';
import 'operation_notifier.dart';

class SearchItemNotifier implements ItemOperationNotifier {
  final log = getLogger<SearchItemNotifier>();

  final List<ItemOperationSubscriber> _subscribers =
      <ItemOperationSubscriber>[];

  @override
  void subscribe({required ItemOperationSubscriber subscriber}) {
    log.logBlocEventSubscriptionAdded(subscriberType: subscriber.runtimeType);

    _subscribers.add(subscriber);
  }

  @override
  void unSubscribe<T>({required ItemOperationSubscriber subscriber}) {
    log.logBlocEventSubscriptionRemoved(subscriberType: subscriber.runtimeType);

    _subscribers.removeWhere((element) => element.id == subscriber.id);
  }

  @override
  void notifySubscriber({required ItemOperationNotification notification}) {
    for (final subscriber in _subscribers) {
      log.logEventNotification(
        subscriberType: subscriber.runtimeType,
        notificationType: notification.runtimeType,
      );
      subscriber.update(notification: notification);
    }
  }
}
