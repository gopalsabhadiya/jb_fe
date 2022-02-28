import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jb_fe/controllers/bloc/inventory/mediator/notification/notification.dart';
import 'package:jb_fe/controllers/bloc/inventory/mediator/subscriber/operation_subscriber.dart';
import 'package:jb_fe/controllers/bloc/order/mediator/notification/notification.dart';
import 'package:jb_fe/controllers/bloc/order/mediator/notifier/operation_notifier.dart';
import 'package:jb_fe/controllers/bloc/order/mediator/subscriber/operation_subscriber.dart';
import 'package:jb_fe/util/extension/common_logging.dart';

import '../../../../../util/logger.dart';

class AddOrderNotifier implements OrderOperationNotifier {
  final log = getLogger<AddOrderNotifier>();

  final List<OrderOperationSubscriber> _subscribers =
      <OrderOperationSubscriber>[];
  final List<ItemOperationSubscriber> _itemSubscriber =
      <ItemOperationSubscriber>[];

  @override
  void subscribe({required OrderOperationSubscriber subscriber}) {
    log.logBlocEventSubscriptionAdded(subscriberType: subscriber.runtimeType);

    _subscribers.add(subscriber);
  }

  void subscribeForItemOperation(
      {required ItemOperationSubscriber itemOperationSubscriber}) {
    log.logBlocEventSubscriptionAdded(
        subscriberType: itemOperationSubscriber.runtimeType);

    _itemSubscriber.add(itemOperationSubscriber);
  }

  @override
  void unSubscribe({required OrderOperationSubscriber subscriber}) {
    log.logBlocEventSubscriptionRemoved(subscriberType: subscriber.runtimeType);

    _subscribers.removeWhere((element) => element.id == subscriber.id);
  }

  void unSubscribeForItemOperation(
      {required ItemOperationSubscriber itemOperationSubscriber}) {
    log.logBlocEventSubscriptionRemoved(
        subscriberType: itemOperationSubscriber.runtimeType);

    _itemSubscriber
        .removeWhere((element) => element.id == itemOperationSubscriber.id);
  }

  @override
  void notifySubscriber({required OrderOperationNotification notification}) {
    for (final subscriber in _subscribers) {
      if (!(subscriber as Bloc).isClosed) {
        log.logEventNotification(
          subscriberType: subscriber.runtimeType,
          notificationType: notification.runtimeType,
        );
        subscriber.update(notification: notification);
      }
    }
  }

  void notifySubscriberForItemOperation(
      {required ItemOperationNotification notification}) {
    for (final subscriber in _itemSubscriber) {
      if (!(subscriber as Bloc).isClosed) {
        log.logEventNotification(
          subscriberType: subscriber.runtimeType,
          notificationType: notification.runtimeType,
        );
        subscriber.update(notification: notification);
      }
    }
  }

  void notifySubscriberForPlacedOrder(
      {required ItemOperationNotification notification}) {
    for (final subscriber in _itemSubscriber) {
      log.logEventNotification(
        subscriberType: subscriber.runtimeType,
        notificationType: notification.runtimeType,
      );
      subscriber.update(notification: notification);
    }
  }
}
