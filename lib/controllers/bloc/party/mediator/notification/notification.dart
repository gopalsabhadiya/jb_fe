import 'package:equatable/equatable.dart';
import 'package:jb_fe/backend_integration/dto/party/party_presentation.dart';

enum NotificationType {
  PARTY_DELETED,
  PARTY_UPDATED,
  PARTY_CREATED,
  PARTY_ADD_REQUEST,
  PARTY_SEARCH_COMPLETE,
  PARTY_SEARCH_CLEARED,
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

class NewPartyNotification extends OperationNotification {
  final PartyPresentation party;

  const NewPartyNotification({
    required this.party,
  }) : super(notificationType: NotificationType.PARTY_CREATED);

  @override
  List<Object> get props => [party, notificationType];
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
  final String searchTerm;
  const SearchPartyCompleteNotification(
      {required this.result, required this.searchTerm})
      : super(notificationType: NotificationType.PARTY_SEARCH_COMPLETE);

  @override
  List<Object> get props => [result, notificationType];
}

class SearchPartyTermClearedNotification extends OperationNotification {
  const SearchPartyTermClearedNotification()
      : super(notificationType: NotificationType.PARTY_SEARCH_CLEARED);
}

class SearchNextPartyPageRequestNotification extends OperationNotification {
  const SearchNextPartyPageRequestNotification()
      : super(notificationType: NotificationType.PARTY_GET_NEXT_PAGE);
}

class AddPartyRequestNotification extends OperationNotification {
  const AddPartyRequestNotification()
      : super(notificationType: NotificationType.PARTY_ADD_REQUEST);
}
