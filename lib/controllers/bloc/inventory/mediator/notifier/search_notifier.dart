import 'package:jb_fe/controllers/bloc/inventory/mediator/notification/notification.dart';
import 'package:jb_fe/controllers/bloc/inventory/mediator/subscriber/operation_subscriber.dart';

import 'operation_notifier.dart';

class SearchItemNotifier implements ItemOperationNotifier {
  final List<ItemOperationSubscriber> _subscribers =
      <ItemOperationSubscriber>[];

  @override
  void subscribe({required ItemOperationSubscriber subscriber}) =>
      _subscribers.add(subscriber);

  @override
  void unSubscribe<T>({required ItemOperationSubscriber subscriber}) =>
      _subscribers.removeWhere((element) => element.id == subscriber.id);

  @override
  void notifySubscriber({required ItemOperationNotification notification}) {
    for (final subscriber in _subscribers) {
      subscriber.update(notification: notification);
    }
  }
}
