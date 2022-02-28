import 'package:jb_fe/controllers/bloc/party/mediator/notification/notification.dart';
import 'package:jb_fe/controllers/bloc/party/mediator/notifier/operation_notifier.dart';
import 'package:jb_fe/controllers/bloc/party/mediator/subscriber/operation_subscriber.dart';
import 'package:jb_fe/util/extension/common_logging.dart';

import '../../../../../util/logger.dart';

class SearchNextPartyPageNotifier implements PartyOperationNotifier {
  final log = getLogger<SearchNextPartyPageNotifier>();

  final List<PartyOperationSubscriber> _subscribers =
      <PartyOperationSubscriber>[];

  @override
  void subscribe({required PartyOperationSubscriber subscriber}) {
    log.logBlocEventSubscriptionAdded(subscriberType: subscriber.runtimeType);
    _subscribers.add(subscriber);
  }

  @override
  void unSubscribe({required PartyOperationSubscriber subscriber}) {
    log.logBlocEventSubscriptionRemoved(subscriberType: subscriber.runtimeType);
    _subscribers.removeWhere((element) => element.id == subscriber.id);
  }

  @override
  void notifySubscriber({required PartyOperationNotification notification}) {
    for (final subscriber in _subscribers) {
      log.logEventNotification(
        subscriberType: subscriber.runtimeType,
        notificationType: notification.runtimeType,
      );
      subscriber.update(notification: notification);
    }
  }
}
