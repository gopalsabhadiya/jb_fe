import 'package:jb_fe/backend_integration/data/datasource/remote/business_remote_ds.dart';
import 'package:jb_fe/backend_integration/domain/entities/business/business.dart';
import 'package:jb_fe/backend_integration/domain/repositories/business_repository.dart';

import '../../../util/logger.dart';

class BusinessRepositoryImpl implements BusinessRepository {
  final log = getLogger<BusinessRepositoryImpl>();

  final BusinessRemoteDataSource remoteDataSource;

  BusinessRepositoryImpl({required this.remoteDataSource});

  @override
  Future<BusinessEntity> getBusinessData() {
    log.d("Fetching business data");
    return remoteDataSource.getBusinessData();
  }

  @override
  Future<BusinessEntity> updateBusiness(BusinessEntity business) async {
    log.d("Updating business data");
    return await remoteDataSource.updateBusiness(business);
  }
}
