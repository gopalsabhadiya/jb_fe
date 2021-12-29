import 'package:jb_fe/controllers/bloc/party/mediator/notification/notification.dart';
import 'package:jb_fe/controllers/bloc/party/mediator/notifier/operation_notifier.dart';
import 'package:jb_fe/controllers/bloc/party/mediator/subscriber/operation_subscriber.dart';

class SearchNextPartyPageNotifier implements PartyOperationNotifier {
  final List<PartyOperationSubscriber> _subscribers =
      <PartyOperationSubscriber>[];

  @override
  void subscribe({required PartyOperationSubscriber subscriber}) {
    print("Search subscriber added");
    _subscribers.add(subscriber);
  }

  @override
  void unSubscribe({required PartyOperationSubscriber subscriber}) =>
      _subscribers.removeWhere((element) => element.id == subscriber.id);

  @override
  void notifySubscriber({required PartyOperationNotification notification}) {
    for (final subscriber in _subscribers) {
      print(subscriber);
      subscriber.update(notification: notification);
    }
  }
}
