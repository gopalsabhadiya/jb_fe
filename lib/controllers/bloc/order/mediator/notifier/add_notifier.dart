import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jb_fe/controllers/bloc/inventory/mediator/notification/notification.dart';
import 'package:jb_fe/controllers/bloc/inventory/mediator/subscriber/operation_subscriber.dart';
import 'package:jb_fe/controllers/bloc/order/mediator/notification/notification.dart';
import 'package:jb_fe/controllers/bloc/order/mediator/notifier/operation_notifier.dart';
import 'package:jb_fe/controllers/bloc/order/mediator/subscriber/operation_subscriber.dart';

class AddOrderNotifier implements OrderOperationNotifier {
  final List<OrderOperationSubscriber> _subscribers =
      <OrderOperationSubscriber>[];
  final List<ItemOperationSubscriber> _itemSubscriber =
      <ItemOperationSubscriber>[];

  @override
  void subscribe({required OrderOperationSubscriber subscriber}) =>
      _subscribers.add(subscriber);

  void subscribeForItemOperation(
          {required ItemOperationSubscriber itemOperationSubscriber}) =>
      _itemSubscriber.add(itemOperationSubscriber);

  @override
  void unSubscribe({required OrderOperationSubscriber subscriber}) =>
      _subscribers.removeWhere((element) => element.id == subscriber.id);

  void unSubscribeForItemOperation(
          {required ItemOperationSubscriber itemOperationSubscriber}) =>
      _itemSubscriber
          .removeWhere((element) => element.id == itemOperationSubscriber.id);

  @override
  void notifySubscriber({required OrderOperationNotification notification}) {
    for (final subscriber in _subscribers) {
      print((subscriber as Bloc).isClosed);
      if (!(subscriber as Bloc).isClosed) {
        subscriber.update(notification: notification);
      }
    }
  }

  void notifySubscriberForItemOperation(
      {required ItemOperationNotification notification}) {
    for (final subscriber in _itemSubscriber) {
      if (!(subscriber as Bloc).isClosed) {
        subscriber.update(notification: notification);
      }
    }
  }

  void notifySubscriberForPlacedOrder(
      {required ItemOperationNotification notification}) {
    for (final subscriber in _itemSubscriber) {
      subscriber.update(notification: notification);
    }
  }
}
