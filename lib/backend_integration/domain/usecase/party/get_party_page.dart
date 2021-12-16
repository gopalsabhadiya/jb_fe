import 'package:jb_fe/backend_integration/domain/entities/party.dart';
import 'package:jb_fe/backend_integration/domain/repositories/party_repository.dart';
import 'package:jb_fe/backend_integration/dto/party/party_presentation.dart';

class GetPartyPageUseCase {
  final PartyRepository repository;

  GetPartyPageUseCase({required this.repository});

  Future<List<PartyPresentation>> call(int pageNumber) async {
    List<PartyEntity> partyEntityList =
        await repository.getPartyPage(pageNumber);
    List<PartyPresentation> partyPresentationList =
        partyEntityList.map((party) => PartyPresentation(party)).toList();
    return partyPresentationList;
  }
}
