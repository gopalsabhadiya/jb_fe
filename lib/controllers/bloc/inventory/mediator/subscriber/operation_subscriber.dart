
import 'package:jb_fe/controllers/bloc/inventory/mediator/notification/notification.dart';

abstract class ItemOperationSubscriber {
  String get id;
  void update({required ItemOperationNotification notification});
}
