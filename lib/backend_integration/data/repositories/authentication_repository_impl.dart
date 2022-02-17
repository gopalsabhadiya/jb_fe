import 'dart:html';

import 'package:jb_fe/backend_integration/data/datasource/remote/authentication_remote_ds.dart';
import 'package:jb_fe/backend_integration/data/datasource/remote/user_remote_ds.dart';
import 'package:jb_fe/backend_integration/domain/entities/authentication/login.dart';
import 'package:jb_fe/backend_integration/domain/entities/authentication/response/login_response.dart';
import 'package:jb_fe/backend_integration/domain/entities/user/user.dart';
import 'package:jb_fe/backend_integration/utils/storage/shared_preference.dart';
import 'package:jb_fe/injection_container.dart';

import '../../domain/repositories/authentication.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationRemoteDataSource authenticationRemoteDataSource;
  final UserRemoteDataSource userRemoteDataSource;

  AuthenticationRepositoryImpl(
      {required this.authenticationRemoteDataSource,
      required this.userRemoteDataSource});

  @override
  Future<UserEntity> authenticateUser(LoginEntity loginEntity) async {
    print("Authenticating user: Repository");
    LoginResponseEntity loginResponseEntity =
        await authenticationRemoteDataSource.authenticateUser(loginEntity);
    serviceLocator<AppSharedPreference>()
        .saveString(key: "csrf", value: loginResponseEntity.token);
    UserEntity userEntity = await userRemoteDataSource.getUser();
    return userEntity;
  }

  @override
  Future<UserEntity> validateAuthentication() async {
    bool validationStatus =
        await authenticationRemoteDataSource.validateAuthentication();
    if (validationStatus) {
      UserEntity userEntity = await userRemoteDataSource.getUser();
      return userEntity;
    } else {
      throw HttpStatus.notFound;
    }
  }

  @override
  Future<void> unAuthenticateUser() async {
    await serviceLocator<AppSharedPreference>().deleteString(key: "csrf");
  }
}
