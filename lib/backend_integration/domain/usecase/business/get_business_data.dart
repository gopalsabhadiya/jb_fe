import 'package:jb_fe/backend_integration/domain/entities/business/business.dart';
import 'package:jb_fe/backend_integration/domain/repositories/business_repository.dart';
import 'package:jb_fe/backend_integration/dto/business/business_presentation.dart';

class GetBusinessDataUseCase {
  final BusinessRepository repository;

  GetBusinessDataUseCase({required this.repository});

  Future<BusinessPresentation> call() async {
    BusinessEntity businessEntity = await repository.getBusinessData();
    BusinessPresentation businessPresentation =
        BusinessPresentation(businessEntity);
    return businessPresentation;
  }
}
