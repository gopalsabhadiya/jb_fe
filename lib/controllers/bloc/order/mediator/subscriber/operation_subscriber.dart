import 'package:jb_fe/controllers/bloc/order/mediator/notification/notification.dart';

abstract class OrderOperationSubscriber {
  String get id;
  void update({required OrderOperationNotification notification});
}
