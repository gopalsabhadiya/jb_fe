import 'package:jb_fe/controllers/bloc/receipt/mediator/notification/notification.dart';
import 'package:jb_fe/controllers/bloc/receipt/mediator/notifier/operation_notifier.dart';
import 'package:jb_fe/controllers/bloc/receipt/mediator/subscriber/operation_subscriber.dart';
import 'package:jb_fe/util/extension/common_logging.dart';

import '../../../../../util/logger.dart';

class DeleteReceiptNotifier implements ReceiptOperationNotifier {
  final log = getLogger<DeleteReceiptNotifier>();

  final List<ReceiptOperationSubscriber> _subscribers =
      <ReceiptOperationSubscriber>[];

  @override
  void subscribe({required ReceiptOperationSubscriber subscriber}) {
    log.logBlocEventSubscriptionAdded(subscriberType: subscriber.runtimeType);

    _subscribers.add(subscriber);
  }

  @override
  void unSubscribe({required ReceiptOperationSubscriber subscriber}) {
    log.logBlocEventSubscriptionRemoved(subscriberType: subscriber.runtimeType);

    _subscribers.removeWhere((element) => element.id == subscriber.id);
  }

  @override
  void notifySubscriber({required ReceiptOperationNotification notification}) {
    for (final subscriber in _subscribers) {
      log.logEventNotification(
        subscriberType: subscriber.runtimeType,
        notificationType: notification.runtimeType,
      );
      subscriber.update(notification: notification);
    }
  }
}
