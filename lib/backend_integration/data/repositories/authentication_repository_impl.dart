import 'package:jb_fe/backend_integration/data/datasource/remote/authentication_remote_ds.dart';
import 'package:jb_fe/backend_integration/domain/entities/authentication/login.dart';
import 'package:jb_fe/backend_integration/domain/entities/authentication/response/login_response.dart';
import 'package:jb_fe/backend_integration/utils/storage/shared_preference.dart';
import 'package:jb_fe/injection_container.dart';

import '../../domain/repositories/authentication.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationRemoteDataSource authenticationRemoteDataSource;

  AuthenticationRepositoryImpl({required this.authenticationRemoteDataSource});

  @override
  Future<bool> authenticateUser(LoginEntity loginEntity) async {
    print("Authenticating user: Repository");
    LoginResponseEntity loginResponseEntity =
        await authenticationRemoteDataSource.authenticateUser(loginEntity);
    serviceLocator<AppSharedPreference>()
        .saveString(key: "csrf", value: loginResponseEntity.token);
    return true;
  }

  @override
  Future<bool> validateAuthentication() async {
    bool validationStatus =
        await authenticationRemoteDataSource.validateAuthentication();
    return validationStatus;
  }

  @override
  Future<void> unAuthenticateUser() async {
    await serviceLocator<AppSharedPreference>().deleteString(key: "csrf");
  }
}
