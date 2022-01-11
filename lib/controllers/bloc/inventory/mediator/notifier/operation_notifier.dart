import 'package:jb_fe/controllers/bloc/inventory/mediator/notification/notification.dart';
import 'package:jb_fe/controllers/bloc/inventory/mediator/subscriber/operation_subscriber.dart';

abstract class ItemOperationNotifier {
  void subscribe({required ItemOperationSubscriber subscriber});

  void unSubscribe<T>({required ItemOperationSubscriber subscriber});

  void notifySubscriber({required ItemOperationNotification notification});
}
