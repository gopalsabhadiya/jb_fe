import 'package:equatable/equatable.dart';
import 'package:jb_fe/backend_integration/dto/party/party_presentation.dart';

enum NotificationType {
  PARTY_DELETED,
  PARTY_UPDATED,
  PARTY_SEARCH_COMPLETE,
  PARTY_SEARCH_REMOVED,
  PARTY_SEARCH_NEXT_PAGE,
  PARTY_GET_NEXT_PAGE
}

class OperationNotification extends Equatable {
  final NotificationType notificationType;
  const OperationNotification({required this.notificationType});

  @override
  List<Object?> get props => [notificationType];
}

class DeletePartyNotification extends OperationNotification {
  final String partyId;

  const DeletePartyNotification({
    required this.partyId,
  }) : super(notificationType: NotificationType.PARTY_DELETED);

  @override
  List<Object> get props => [partyId, notificationType];
}

class UpdatePartyNotification extends OperationNotification {
  final PartyPresentation party;

  const UpdatePartyNotification({
    required this.party,
  }) : super(notificationType: NotificationType.PARTY_UPDATED);

  @override
  List<Object> get props => [party, notificationType];
}

class SearchPartyCompleteNotification extends OperationNotification {
  final List<PartyPresentation> result;
  const SearchPartyCompleteNotification({
    required this.result,
  }) : super(notificationType: NotificationType.PARTY_SEARCH_COMPLETE);

  @override
  List<Object> get props => [result, notificationType];
}

class SearchPartyTermRemovedNotification extends OperationNotification {
  const SearchPartyTermRemovedNotification()
      : super(notificationType: NotificationType.PARTY_SEARCH_REMOVED);
}

class NextPartyPageRequestNotification extends OperationNotification {
  final int skip;

  const NextPartyPageRequestNotification({required this.skip})
      : super(notificationType: NotificationType.PARTY_GET_NEXT_PAGE);
}
