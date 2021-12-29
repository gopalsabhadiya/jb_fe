import 'package:equatable/equatable.dart';
import 'package:jb_fe/backend_integration/dto/party/party_presentation.dart';

enum PartyNotificationType {
  PARTY_DELETED,
  PARTY_UPDATED,
  PARTY_CREATED,
  PARTY_ADD_REQUEST,
  PARTY_SEARCH_COMPLETE,
  PARTY_SEARCH_CLEARED,
  PARTY_GET_NEXT_PAGE
}

class PartyOperationNotification extends Equatable {
  final PartyNotificationType notificationType;
  const PartyOperationNotification({required this.notificationType});

  @override
  List<Object?> get props => [notificationType];
}

class DeletePartyNotification extends PartyOperationNotification {
  final String partyId;

  const DeletePartyNotification({
    required this.partyId,
  }) : super(notificationType: PartyNotificationType.PARTY_DELETED);

  @override
  List<Object> get props => [partyId, notificationType];
}

class NewPartyNotification extends PartyOperationNotification {
  final PartyPresentation party;

  const NewPartyNotification({
    required this.party,
  }) : super(notificationType: PartyNotificationType.PARTY_CREATED);

  @override
  List<Object> get props => [party, notificationType];
}

class UpdatePartyNotification extends PartyOperationNotification {
  final PartyPresentation party;

  const UpdatePartyNotification({
    required this.party,
  }) : super(notificationType: PartyNotificationType.PARTY_UPDATED);

  @override
  List<Object> get props => [party, notificationType];
}

class SearchPartyCompleteNotification extends PartyOperationNotification {
  final List<PartyPresentation> result;
  final String searchTerm;
  const SearchPartyCompleteNotification(
      {required this.result, required this.searchTerm})
      : super(notificationType: PartyNotificationType.PARTY_SEARCH_COMPLETE);

  @override
  List<Object> get props => [result, notificationType];
}

class SearchPartyTermClearedNotification extends PartyOperationNotification {
  const SearchPartyTermClearedNotification()
      : super(notificationType: PartyNotificationType.PARTY_SEARCH_CLEARED);
}

class SearchNextPartyPageRequestNotification extends PartyOperationNotification {
  const SearchNextPartyPageRequestNotification()
      : super(notificationType: PartyNotificationType.PARTY_GET_NEXT_PAGE);
}

class AddPartyRequestNotification extends PartyOperationNotification {
  const AddPartyRequestNotification()
      : super(notificationType: PartyNotificationType.PARTY_ADD_REQUEST);
}
