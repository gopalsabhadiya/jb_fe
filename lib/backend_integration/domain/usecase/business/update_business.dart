import 'package:jb_fe/backend_integration/domain/entities/business/business.dart';
import 'package:jb_fe/backend_integration/domain/repositories/business_repository.dart';
import 'package:jb_fe/backend_integration/dto/business/business_presentation.dart';

class UpdateBusinessUseCase {
  final BusinessRepository repository;

  UpdateBusinessUseCase({required this.repository});

  Future<BusinessPresentation> call(
      {required BusinessPresentation business}) async {
    business.updateValues();
    final BusinessEntity entity =
        await repository.updateBusiness(business.getEntity());
    return BusinessPresentation(entity);
  }
}
