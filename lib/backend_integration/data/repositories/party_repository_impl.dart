import 'package:jb_fe/backend_integration/data/datasource/remote/party_remote_ds.dart';
import 'package:jb_fe/backend_integration/domain/entities/party/party.dart';
import 'package:jb_fe/backend_integration/domain/repositories/party_repository.dart';

class PartyRepositoryImpl implements PartyRepository {
  final PartyRemoteDataSource remoteDataSource;

  PartyRepositoryImpl({required this.remoteDataSource});

  @override
  Future<PartyEntity> addParty(PartyEntity party) async {
    return await remoteDataSource.addParty(party);
  }

  @override
  Future<void> deleteParty(String partyId) async {
    return await remoteDataSource.deleteParty(partyId);
  }

  @override
  Future<PartyEntity> getParty(String partyId) async {
    return await remoteDataSource.getParty(partyId);
  }

  @override
  Future<List<PartyEntity>> searchParty(String searchTerm, int skip) async {
    return await remoteDataSource.searchParty(searchTerm, skip);
  }

  @override
  Future<PartyEntity> updateParty(PartyEntity party) async {
    return await remoteDataSource.updateParty(party);
  }

  @override
  Future<List<PartyEntity>> getPartyPage(int skip) async {
    return await remoteDataSource.getPartyPage(skip);
  }

  @override
  Future<PartyEntity> fetchParty(String partyId) async {
    return await remoteDataSource.fetchParty(partyId);
  }
}
