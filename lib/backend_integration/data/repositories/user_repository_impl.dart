import '../../../util/logger.dart';
import '../../domain/entities/user/user.dart';
import '../../domain/repositories/user_repository.dart';
import '../datasource/remote/user_remote_ds.dart';

class UserRepositoryImpl implements UserRepository {
  final log = getLogger<UserRepositoryImpl>();

  final UserRemoteDataSource remoteDataSource;

  UserRepositoryImpl({required this.remoteDataSource});

  @override
  Future<UserEntity> getUser() async {
    log.d("Fetching User");
    return await remoteDataSource.getUser();
  }
}
