import 'package:jb_fe/backend_integration/data/datasource/party_remote_ds.dart';
import 'package:jb_fe/backend_integration/data/models/party_model.dart';
import 'package:jb_fe/backend_integration/domain/entities/party.dart';
import 'package:jb_fe/backend_integration/domain/repositories/party_repository.dart';

class PartyRepositoryImpl implements PartyRepository {
  final PartyRemoteDataSource remoteDataSource;

  PartyRepositoryImpl({required this.remoteDataSource});

  @override
  Future<PartyEntity> addParty(PartyEntity party) async {
    return await remoteDataSource.addParty(party.getModel());
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
  Future<List<PartyEntity>> searchParty(
      String searchTerm, int pageNumber) async {
    return await remoteDataSource.searchParty(searchTerm, pageNumber);
  }

  @override
  Future<PartyEntity> updateParty(PartyEntity party) async {
    return await remoteDataSource.updateParty(party.getModel());
  }

  @override
  Future<List<PartyEntity>> getPartyPage(int pageNumber) async {
    return await remoteDataSource.getPartyPage(pageNumber);
  }
}
