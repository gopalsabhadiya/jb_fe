import 'package:jb_fe/backend_integration/domain/repositories/party_repository.dart';
import 'package:jb_fe/backend_integration/dto/party/party_presentation.dart';

class FetchPartyUseCase {
  final PartyRepository repository;

  FetchPartyUseCase({required this.repository});

  Future<PartyPresentation> call({required String partyId}) async {
    final partyEntity = await repository.fetchParty(partyId);
    return PartyPresentation(partyEntity);
  }
}
