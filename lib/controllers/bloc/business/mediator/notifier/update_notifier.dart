import 'package:jb_fe/controllers/bloc/business/mediator/notification/notification.dart';
import 'package:jb_fe/controllers/bloc/business/mediator/notifier/operation_notifier.dart';
import 'package:jb_fe/controllers/bloc/business/mediator/subscriber/operation_subscriber.dart';

class UpdateBusinessNotifier implements BusinessOperationNotifier {
  final List<BusinessOperationSubscriber> _subscribers =
      <BusinessOperationSubscriber>[];

  @override
  void subscribe({required BusinessOperationSubscriber subscriber}) =>
      _subscribers.add(subscriber);

  @override
  void unSubscribe({required BusinessOperationSubscriber subscriber}) =>
      _subscribers.removeWhere((element) => element.id == subscriber.id);

  @override
  void notifySubscriber({required BusinessOperationNotification notification}) {
    for (final subscriber in _subscribers) {
      subscriber.update(notification: notification);
    }
  }
}
