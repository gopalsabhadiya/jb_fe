import 'dart:convert';

import 'package:jb_fe/backend_integration/client/http_client.dart';
import 'package:jb_fe/backend_integration/constants/uri/endpoints.dart';
import 'package:jb_fe/backend_integration/domain/entities/party/party.dart';

abstract class PartyRemoteDataSource {
  Future<PartyEntity> getParty(String partyId);
  Future<List<PartyEntity>> getPartyPage(int pageNumber);
  Future<PartyEntity> addParty(PartyEntity party);
  Future<PartyEntity> updateParty(PartyEntity party);
  Future<void> deleteParty(String partyId);
  Future<List<PartyEntity>> searchParty(String searchTerm, int pageNumber);
}

class PartyRemoteDataSourceImpl implements PartyRemoteDataSource {
  final _http = AppHttpClient.getHttpClient();

  @override
  Future<PartyEntity> addParty(PartyEntity party) async {
    final response = await _http.post(
      EndpointUri.getBaseParty(),
      body: jsonEncode(party.toJson()),
      headers: {
        "content-type": "application/json",
      },
    );
    return PartyEntity.fromJson(jsonDecode(response.body));
  }

  @override
  Future<void> deleteParty(String partyId) async {
    try {
      final response = await _http.delete(
        EndpointUri.getDeletePartyURL(partyId),
        headers: {"content-type": "application/json"},
      );
    } catch (e) {
      print("Exception");
    }
  }

  @override
  Future<PartyEntity> getParty(String partyId) {
    // TODO: implement getParty
    throw UnimplementedError();
  }

  @override
  Future<List<PartyEntity>> searchParty(String searchTerm, int skip) async {
    final response = await _http.get(
      EndpointUri.getSearchPartyURL(skip, searchTerm),
      headers: {
        "content-type": "application/json",
      },
    );
    List<PartyEntity> partyPage =
        PartyEntity.fromJsonToList(json.decode(response.body));
    // print("Your parties: $partyPage");
    return partyPage;
  }

  @override
  Future<PartyEntity> updateParty(PartyEntity party) async {
    final response = await _http.put(
      EndpointUri.getUpdatePartyURL(),
      body: jsonEncode(party.toJson()),
      headers: {
        "content-type": "application/json",
      },
    );
    return PartyEntity.fromJson(jsonDecode(response.body));
  }

  @override
  Future<List<PartyEntity>> getPartyPage(int skip) async {
    final response = await _http.get(
      EndpointUri.getPartyPage(skip),
      headers: {
        "content-type": "application/json",
      },
    );
    List<PartyEntity> partyPage = PartyEntity.fromJsonToList(
      json.decode(response.body),
    );
    return partyPage;
  }
}
