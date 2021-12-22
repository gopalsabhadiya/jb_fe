import 'dart:convert';

import 'package:jb_fe/backend_integration/client/http_client.dart';
import 'package:jb_fe/backend_integration/constants/uri/endpoints.dart';
import 'package:jb_fe/backend_integration/data/models/party_model.dart';
import 'package:jb_fe/backend_integration/domain/entities/party.dart';

abstract class PartyRemoteDataSource {
  Future<List<PartyModel>> getAllParties();
  Future<PartyModel> getParty(String partyId);
  Future<List<PartyModel>> getPartyPage(int pageNumber);
  Future<PartyModel> addParty(PartyModel party);
  Future<PartyModel> updateParty(PartyModel party);
  Future<void> deleteParty(String partyId);
  Future<List<PartyModel>> searchParty(String searchTerm, int pageNumber);
}

class PartyRemoteDataSourceImpl implements PartyRemoteDataSource {
  final _http = AppHttpClient.getHttpClient();

  @override
  Future<PartyModel> addParty(PartyEntity party) {
    // TODO: implement addParty
    throw UnimplementedError();
  }

  @override
  Future<void> deleteParty(String partyId) async {
    print("Deleting party in ds: $partyId");
    try {
      final response = await _http.delete(
        EndpointUri.getDeletePartyURL(partyId),
        headers: {"content-type": "application/json"},
      );
      print("Party Deleted: ${response.statusCode}");
    } catch (e) {
      print("Exception");
    }
  }

  @override
  Future<List<PartyModel>> getAllParties() async {
    final response = await _http.get(
      EndpointUri.getBaseParty(),
      headers: {"content-type": "application/json"},
    );
    List<PartyModel> parties =
        PartyModel.fromJsonToList(json.decode(response.body));
    return parties;
  }

  @override
  Future<PartyModel> getParty(String partyId) {
    // TODO: implement getParty
    throw UnimplementedError();
  }

  @override
  Future<List<PartyModel>> searchParty(
      String searchTerm, int pageNumber) async {
    print("Search party API");
    final response = await _http.get(
      EndpointUri.getSearchPartyURL(pageNumber, searchTerm),
      headers: {
        "content-type": "application/json",
      },
    );
    List<PartyModel> partyPage =
        PartyModel.fromJsonToList(json.decode(response.body));
    // print("Your parties: $partyPage");
    return partyPage;
  }

  @override
  Future<PartyModel> updateParty(PartyModel party) async {
    final response = await _http.put(
      EndpointUri.getBaseParty(),
      body: jsonEncode(party.toJson()),
      headers: {
        "content-type": "application/json",
      },
    );
    return PartyModel.fromJson(jsonDecode(response.body));
  }

  @override
  Future<List<PartyModel>> getPartyPage(int pageNumber) async {
    final response = await _http.get(
      EndpointUri.getPartyPage(pageNumber),
      headers: {
        "content-type": "application/json",
      },
    );
    List<PartyModel> partyPage =
        PartyModel.fromJsonToList(json.decode(response.body));
    return partyPage;
  }
}
