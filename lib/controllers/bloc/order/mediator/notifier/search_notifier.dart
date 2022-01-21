import 'package:jb_fe/controllers/bloc/order/mediator/notification/notification.dart';
import 'package:jb_fe/controllers/bloc/order/mediator/notifier/operation_notifier.dart';
import 'package:jb_fe/controllers/bloc/order/mediator/subscriber/operation_subscriber.dart';

class SearchOrderNotifier implements OrderOperationNotifier {
  final List<OrderOperationSubscriber> _subscribers =
      <OrderOperationSubscriber>[];

  @override
  void subscribe({required OrderOperationSubscriber subscriber}) =>
      _subscribers.add(subscriber);

  @override
  void unSubscribe({required OrderOperationSubscriber subscriber}) =>
      _subscribers.removeWhere((element) => element.id == subscriber.id);

  @override
  void notifySubscriber({required OrderOperationNotification notification}) {
    for (final subscriber in _subscribers) {
      subscriber.update(notification: notification);
    }
  }
}
