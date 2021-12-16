import 'package:jb_fe/backend_integration/domain/entities/party.dart';
import 'package:jb_fe/backend_integration/domain/repositories/party_repository.dart';

class SearchParty {
  final PartyRepository repository;

  SearchParty(this.repository);

  Future<List<PartyEntity>> call({required String searchTerm}) async {
    return await repository.searchParty(searchTerm);
  }
}
