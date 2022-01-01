import 'package:jb_fe/backend_integration/domain/entities/party/party.dart';
import 'package:jb_fe/backend_integration/domain/repositories/party_repository.dart';
import 'package:jb_fe/backend_integration/dto/party/party_presentation.dart';

class UpdatePartyUseCase {
  final PartyRepository repository;

  UpdatePartyUseCase({required this.repository});

  Future<PartyPresentation> call({required PartyPresentation party}) async {
    party.updateValues();
    final PartyEntity entity = await repository.updateParty(party.getEntity());
    return PartyPresentation(entity);
  }
}
