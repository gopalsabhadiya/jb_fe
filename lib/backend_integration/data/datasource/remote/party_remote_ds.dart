import 'dart:convert';

import 'package:jb_fe/backend_integration/client/http_client.dart';
import 'package:jb_fe/backend_integration/constants/uri/endpoints.dart';
import 'package:jb_fe/backend_integration/domain/entities/party/party.dart';

import '../../../../util/exceptions/app_exception.dart';
import '../../../../util/logger.dart';
import '../../../utils/header_utils.dart';

abstract class PartyRemoteDataSource {
  Future<PartyEntity> getParty(String partyId);
  Future<List<PartyEntity>> getPartyPage(int pageNumber);
  Future<PartyEntity> addParty(PartyEntity party);
  Future<PartyEntity> updateParty(PartyEntity party);
  Future<void> deleteParty(String partyId);
  Future<List<PartyEntity>> searchParty(String searchTerm, int pageNumber);
  Future<PartyEntity> fetchParty(String partyId);
}

class PartyRemoteDataSourceImpl implements PartyRemoteDataSource {
  final log = getLogger<PartyRemoteDataSourceImpl>();

  final _http = AppHttpClient.getHttpClient();

  @override
  Future<PartyEntity> addParty(PartyEntity party) async {
    try {
      final response = await _http.post(
        EndpointUri.getBaseParty(),
        body: jsonEncode(party.toJson()),
        headers: HeaderUtils.getHeader(),
      );
      return PartyEntity.fromJson(jsonDecode(response.body));
    } on AppException {
      rethrow;
    } catch (e) {
      log.e(
        "Error while fetching response for: ${EndpointUri.getBaseParty()}",
      );
      log.e(e);
      rethrow;
    }
  }

  @override
  Future<void> deleteParty(String partyId) async {
    try {
      final response = await _http.delete(
        EndpointUri.getDeletePartyURL(partyId),
        headers: HeaderUtils.getHeader(),
      );
    } on AppException {
      rethrow;
    } catch (e) {
      log.e(
        "Error while fetching response for: ${EndpointUri.getDeletePartyURL(partyId)}",
      );
      log.e(e);
      rethrow;
    }
  }

  @override
  Future<PartyEntity> getParty(String partyId) {
    // TODO: implement getParty
    throw UnimplementedError();
  }

  @override
  Future<List<PartyEntity>> searchParty(String searchTerm, int skip) async {
    try {
      final response = await _http.get(
        EndpointUri.getSearchPartyURL(skip, searchTerm),
        headers: HeaderUtils.getHeader(),
      );
      List<PartyEntity> partyPage =
          PartyEntity.fromJsonToList(json.decode(response.body));
      // print("Your parties: $partyPage");
      return partyPage;
    } on AppException {
      rethrow;
    } catch (e) {
      log.e(
        "Error while fetching response for: ${EndpointUri.getSearchPartyURL(skip, searchTerm)}",
      );
      log.e(e);
      rethrow;
    }
  }

  @override
  Future<PartyEntity> updateParty(PartyEntity party) async {
    try {
      final response = await _http.put(
        EndpointUri.getUpdatePartyURL(),
        body: jsonEncode(party.toJson()),
        headers: HeaderUtils.getHeader(),
      );
      return PartyEntity.fromJson(jsonDecode(response.body));
    } on AppException {
      rethrow;
    } catch (e) {
      log.e(
        "Error while fetching response for: ${EndpointUri.getUpdatePartyURL()}",
      );
      log.e(e);
      rethrow;
    }
  }

  @override
  Future<List<PartyEntity>> getPartyPage(int skip) async {
    try {
      final response = await _http.get(
        EndpointUri.getPartyPage(skip),
        headers: HeaderUtils.getHeader(),
      );
      List<PartyEntity> partyPage = PartyEntity.fromJsonToList(
        json.decode(response.body),
      );
      return partyPage;
    } on AppException {
      rethrow;
    } catch (e) {
      log.e(
        "Error while fetching response for: ${EndpointUri.getPartyPage(skip)}",
      );
      log.e(e);
      rethrow;
    }
  }

  @override
  Future<PartyEntity> fetchParty(String partyId) async {
    try {
      final response = await _http.get(
        EndpointUri.getPartyByIdURL(partyId),
        headers: HeaderUtils.getHeader(),
      );

      PartyEntity party = PartyEntity.fromJson(
        json.decode(response.body),
      );
      return party;
    } on AppException {
      rethrow;
    } catch (e) {
      log.e(
        "Error while fetching response for: ${EndpointUri.getPartyByIdURL(partyId)}",
      );
      log.e(e);
      rethrow;
    }
  }
}
