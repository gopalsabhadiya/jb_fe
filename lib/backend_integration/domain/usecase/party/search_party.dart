import 'package:jb_fe/backend_integration/domain/entities/party/party.dart';
import 'package:jb_fe/backend_integration/domain/repositories/party_repository.dart';
import 'package:jb_fe/backend_integration/dto/party/party_presentation.dart';

class SearchPartyUseCase {
  final PartyRepository repository;

  SearchPartyUseCase({required this.repository});

  Future<List<PartyPresentation>> call({
    required String searchTerm,
    int skip = 0,
  }) async {
    List<PartyEntity> partyEntityList =
        await repository.searchParty(searchTerm, skip);

    List<PartyPresentation> partyPresentationList =
        partyEntityList.map((party) => PartyPresentation(party)).toList();

    return partyPresentationList;
  }
}
