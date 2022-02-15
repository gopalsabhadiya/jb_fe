import 'package:jb_fe/controllers/bloc/business/mediator/notification/notification.dart';

abstract class BusinessOperationSubscriber {
  String get id;
  void update({required BusinessOperationNotification notification});
}
