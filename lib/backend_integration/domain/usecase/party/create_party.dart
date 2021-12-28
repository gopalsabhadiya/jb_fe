import 'package:jb_fe/backend_integration/domain/repositories/party_repository.dart';
import 'package:jb_fe/backend_integration/dto/party/party_presentation.dart';

class CreatePartyUseCase {
  final PartyRepository repository;

  CreatePartyUseCase({required this.repository});

  Future<PartyPresentation> call({required PartyPresentation party}) async {
    party.updateValues();
    final partyEntity = await repository.addParty(party.getEntity());
    return PartyPresentation(partyEntity);
  }
}
