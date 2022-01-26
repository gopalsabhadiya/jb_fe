import 'package:jb_fe/controllers/bloc/receipt/mediator/notification/notification.dart';
import 'package:jb_fe/controllers/bloc/receipt/mediator/subscriber/operation_subscriber.dart';

abstract class ReceiptOperationNotifier {
  void subscribe({required ReceiptOperationSubscriber subscriber});

  void unSubscribe({required ReceiptOperationSubscriber subscriber});

  void notifySubscriber({required ReceiptOperationNotification notification});
}
