import 'package:jb_fe/controllers/bloc/party/mediator/notification/notification.dart';
import 'package:jb_fe/controllers/bloc/party/mediator/subscriber/operation_subscriber.dart';

abstract class PartyOperationNotifier {
  void subscribe({required PartyOperationSubscriber subscriber});

  void unSubscribe({required PartyOperationSubscriber subscriber});

  void notifySubscriber({required OperationNotification notification});
}
