import 'package:jb_fe/controllers/bloc/business/mediator/notification/notification.dart';
import 'package:jb_fe/controllers/bloc/business/mediator/subscriber/operation_subscriber.dart';

abstract class BusinessOperationNotifier {
  void subscribe({required BusinessOperationSubscriber subscriber});

  void unSubscribe({required BusinessOperationSubscriber subscriber});

  void notifySubscriber({required BusinessOperationNotification notification});
}
