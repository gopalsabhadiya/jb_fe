import 'package:jb_fe/controllers/bloc/receipt/mediator/notification/notification.dart';

abstract class ReceiptOperationSubscriber {
  String get id;
  void update({required ReceiptOperationNotification notification});
}
