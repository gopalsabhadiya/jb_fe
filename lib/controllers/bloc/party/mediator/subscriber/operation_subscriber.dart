import 'package:jb_fe/controllers/bloc/party/mediator/notification/notification.dart';

abstract class PartyOperationSubscriber {
  String get id;
  void update({required PartyOperationNotification notification});
}
