import 'package:jb_fe/controllers/bloc/business/mediator/notification/notification.dart';
import 'package:jb_fe/controllers/bloc/business/mediator/notifier/operation_notifier.dart';
import 'package:jb_fe/controllers/bloc/business/mediator/subscriber/operation_subscriber.dart';
import 'package:jb_fe/util/extension/common_logging.dart';

import '../../../../../util/logger.dart';

class UpdateBusinessNotifier implements BusinessOperationNotifier {
  final log = getLogger<UpdateBusinessNotifier>();

  final List<BusinessOperationSubscriber> _subscribers =
      <BusinessOperationSubscriber>[];

  @override
  void subscribe({required BusinessOperationSubscriber subscriber}) {
    log.logBlocEventSubscriptionAdded(subscriberType: subscriber.runtimeType);
    _subscribers.add(subscriber);
  }

  @override
  void unSubscribe({required BusinessOperationSubscriber subscriber}) {
    log.logBlocEventSubscriptionRemoved(subscriberType: subscriber.runtimeType);
    _subscribers.removeWhere((element) => element.id == subscriber.id);
  }

  @override
  void notifySubscriber({required BusinessOperationNotification notification}) {
    for (final subscriber in _subscribers) {
      log.logEventNotification(
        subscriberType: subscriber.runtimeType,
        notificationType: notification.runtimeType,
      );
      subscriber.update(notification: notification);
    }
  }
}
