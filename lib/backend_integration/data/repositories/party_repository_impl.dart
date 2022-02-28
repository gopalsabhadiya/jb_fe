import 'package:jb_fe/backend_integration/data/datasource/remote/party_remote_ds.dart';
import 'package:jb_fe/backend_integration/domain/entities/party/party.dart';
import 'package:jb_fe/backend_integration/domain/repositories/party_repository.dart';

import '../../../util/logger.dart';

class PartyRepositoryImpl implements PartyRepository {
  final log = getLogger<PartyRepositoryImpl>();

  final PartyRemoteDataSource remoteDataSource;

  PartyRepositoryImpl({required this.remoteDataSource});

  @override
  Future<PartyEntity> addParty(PartyEntity party) async {
    log.d("Adding party");
    return await remoteDataSource.addParty(party);
  }

  @override
  Future<void> deleteParty(String partyId) async {
    log.d("Deleting party");
    return await remoteDataSource.deleteParty(partyId);
  }

  @override
  Future<PartyEntity> getParty(String partyId) async {
    log.d("Fetching party");
    return await remoteDataSource.getParty(partyId);
  }

  @override
  Future<List<PartyEntity>> searchParty(String searchTerm, int skip) async {
    log.d("Searching party");
    return await remoteDataSource.searchParty(searchTerm, skip);
  }

  @override
  Future<PartyEntity> updateParty(PartyEntity party) async {
    log.d("Updating party");
    return await remoteDataSource.updateParty(party);
  }

  @override
  Future<List<PartyEntity>> getPartyPage(int skip) async {
    log.d("Fetching party page");
    return await remoteDataSource.getPartyPage(skip);
  }

  @override
  Future<PartyEntity> fetchParty(String partyId) async {
    log.d("Fetching party");
    return await remoteDataSource.fetchParty(partyId);
  }
}
