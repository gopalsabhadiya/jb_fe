import 'package:equatable/equatable.dart';
import 'package:jb_fe/backend_integration/dto/business/business_presentation.dart';

enum BusinessNotificationType {
  BUSINESS_UPDATED,
}

class BusinessOperationNotification extends Equatable {
  final BusinessNotificationType notificationType;
  const BusinessOperationNotification({required this.notificationType});

  @override
  List<Object?> get props => [notificationType];
}

class UpdateBusinessNotification extends BusinessOperationNotification {
  final BusinessPresentation business;

  const UpdateBusinessNotification({
    required this.business,
  }) : super(notificationType: BusinessNotificationType.BUSINESS_UPDATED);

  @override
  List<Object> get props => [business, notificationType];
}
