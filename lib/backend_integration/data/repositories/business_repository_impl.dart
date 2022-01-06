import 'package:jb_fe/backend_integration/data/datasource/remote/business_remote_ds.dart';
import 'package:jb_fe/backend_integration/domain/entities/business/business.dart';
import 'package:jb_fe/backend_integration/domain/repositories/business_repository.dart';

class BusinessRepositoryImpl implements BusinessRepository {
  final BusinessRemoteDataSource remoteDataSource;

  BusinessRepositoryImpl({required this.remoteDataSource});

  @override
  Future<BusinessEntity> getBusinessData() {
    return remoteDataSource.getBusinessData();
  }
}
