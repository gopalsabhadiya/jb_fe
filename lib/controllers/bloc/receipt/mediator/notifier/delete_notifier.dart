import 'package:jb_fe/controllers/bloc/receipt/mediator/notification/notification.dart';
import 'package:jb_fe/controllers/bloc/receipt/mediator/notifier/operation_notifier.dart';
import 'package:jb_fe/controllers/bloc/receipt/mediator/subscriber/operation_subscriber.dart';

class DeleteReceiptNotifier implements ReceiptOperationNotifier {
  final List<ReceiptOperationSubscriber> _subscribers =
      <ReceiptOperationSubscriber>[];

  @override
  void subscribe({required ReceiptOperationSubscriber subscriber}) =>
      _subscribers.add(subscriber);

  @override
  void unSubscribe({required ReceiptOperationSubscriber subscriber}) =>
      _subscribers.removeWhere((element) => element.id == subscriber.id);

  @override
  void notifySubscriber({required ReceiptOperationNotification notification}) {
    for (final subscriber in _subscribers) {
      subscriber.update(notification: notification);
    }
  }
}
