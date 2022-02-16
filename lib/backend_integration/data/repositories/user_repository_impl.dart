import '../../domain/entities/user/user.dart';
import '../../domain/repositories/user_repository.dart';
import '../datasource/remote/user_remote_ds.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;

  UserRepositoryImpl({required this.remoteDataSource});

  @override
  Future<UserEntity> getUser() async {
    print("!");
    return await remoteDataSource.getUser();
  }
}
