import 'package:jb_fe/backend_integration/domain/repositories/party_repository.dart';

class DeletePartyUseCase {
  final PartyRepository repository;

  DeletePartyUseCase({required this.repository});

  Future<void> call({required String partyId}) async {
    return await repository.deleteParty(partyId);
  }
}
