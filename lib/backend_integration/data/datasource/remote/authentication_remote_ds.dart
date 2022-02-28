import 'dart:convert';

import 'package:jb_fe/backend_integration/domain/entities/authentication/login.dart';
import 'package:jb_fe/backend_integration/domain/entities/authentication/response/login_response.dart';
import 'package:jb_fe/backend_integration/utils/header_utils.dart';

import '../../../../injection_container.dart';
import '../../../../util/logger.dart';
import '../../../client/http_client.dart';
import '../../../constants/uri/endpoints.dart';
import '../../../utils/storage/shared_preference.dart';

abstract class AuthenticationRemoteDataSource {
  Future<LoginResponseEntity> authenticateUser(LoginEntity loginEntity);
  Future<bool> validateAuthentication();
}

class AuthenticationRemoteDataSourceImpl
    implements AuthenticationRemoteDataSource {
  final log = getLogger<AuthenticationRemoteDataSource>();

  final _http = AppHttpClient.getHttpClient();

  @override
  Future<LoginResponseEntity> authenticateUser(LoginEntity loginEntity) async {
    final response = await _http.post(
      EndpointUri.getAuthenticateURL(),
      body: jsonEncode(loginEntity.toJson()),
      headers: HeaderUtils.getHeader(),
    );
    final LoginResponseEntity entity =
        LoginResponseEntity.fromJson(jsonDecode(response.body));
    return entity;
  }

  @override
  Future<bool> validateAuthentication() async {
    final String csrfToken =
        await serviceLocator<AppSharedPreference>().getString(key: "csrf");
    if (csrfToken.isNotEmpty) {
      LoginResponseEntity loginRequest =
          LoginResponseEntity(token: csrfToken, subscriptionExpired: false);
      final response = await _http.post(
        EndpointUri.getValidateAuthenticationURL(),
        headers: HeaderUtils.getHeader(),
        body: jsonEncode(
          loginRequest.toJson(),
        ),
      );
      if (response.statusCode == 200) {
        return true;
      }
    }
    return false;
  }
}
