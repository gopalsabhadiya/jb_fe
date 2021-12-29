import 'package:jb_fe/backend_integration/domain/entities/party.dart';
import 'package:jb_fe/backend_integration/domain/repositories/party_repository.dart';

class AddPartyUseCase {
  final PartyRepository repository;

  AddPartyUseCase({required this.repository});

  Future<PartyEntity> call({required String partyId}) async {
    return await repository.getParty(partyId);
  }
}
