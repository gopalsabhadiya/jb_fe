import 'package:jb_fe/backend_integration/domain/entities/business/business.dart';

abstract class BusinessRepository {
  Future<BusinessEntity> getBusinessData();
  Future<BusinessEntity> updateBusiness(BusinessEntity business);
}
