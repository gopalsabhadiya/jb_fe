import '../entities/user/user.dart';

abstract class UserRepository {
  Future<UserEntity> getUser();
}
