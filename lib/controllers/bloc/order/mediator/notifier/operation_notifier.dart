import 'package:jb_fe/controllers/bloc/order/mediator/notification/notification.dart';
import 'package:jb_fe/controllers/bloc/order/mediator/subscriber/operation_subscriber.dart';

abstract class OrderOperationNotifier {
  void subscribe({required OrderOperationSubscriber subscriber});

  void unSubscribe({required OrderOperationSubscriber subscriber});

  void notifySubscriber({required OrderOperationNotification notification});
}
