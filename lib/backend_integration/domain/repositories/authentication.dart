import 'package:jb_fe/backend_integration/domain/entities/authentication/login.dart';

abstract class AuthenticationRepository {
  Future<bool> authenticateUser(LoginEntity loginEntity);
  Future<bool> validateAuthentication();
  Future<void> unAuthenticateUser();
}
