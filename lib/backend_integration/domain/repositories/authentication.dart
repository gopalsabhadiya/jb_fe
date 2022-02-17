import 'package:jb_fe/backend_integration/domain/entities/authentication/login.dart';
import 'package:jb_fe/backend_integration/domain/entities/user/user.dart';

abstract class AuthenticationRepository {
  Future<UserEntity> authenticateUser(LoginEntity loginEntity);
  Future<UserEntity> validateAuthentication();
  Future<void> unAuthenticateUser();
}
