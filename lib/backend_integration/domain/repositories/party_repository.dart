import 'dart:async';

import 'package:jb_fe/backend_integration/domain/entities/party.dart';

abstract class PartyRepository {
  Future<List<PartyEntity>> getPartyPage(int pageNumber);
  Future<PartyEntity> getParty(String partyId);
  Future<PartyEntity> addParty(PartyEntity party);
  Future<PartyEntity> updateParty(PartyEntity party);
  Future<void> deleteParty(String partyId);
  Future<List<PartyEntity>> searchParty(String searchTerm, int pageNumber);
}
