import 'dart:convert';

import 'package:jb_fe/backend_integration/data/datasource/remote/response_validation/authentication_response_validation.dart';
import 'package:jb_fe/backend_integration/domain/entities/authentication/login.dart';
import 'package:jb_fe/backend_integration/domain/entities/authentication/response/login_response.dart';
import 'package:jb_fe/backend_integration/utils/header_utils.dart';
import 'package:jb_fe/util/exceptions/app_exception.dart';

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
    try {
      log.d("Trying to authenticate User: ${loginEntity.email}");
      final response = await _http.post(
        EndpointUri.getAuthenticateURL(),
        body: jsonEncode(loginEntity.toJson()),
        headers: HeaderUtils.getHeader(),
      );

      AuthenticationResponseValidation.validateAuthenticateUserResponse(
        loginEntity.email,
        response,
      );

      final LoginResponseEntity entity =
          LoginResponseEntity.fromJson(jsonDecode(response.body));
      return entity;
    } on AppException {
      rethrow;
    } catch (e) {
      log.e(
        "Error while fetching response for: ${EndpointUri.getAuthenticateURL()}",
      );
      log.e(e);
      rethrow;
    }
  }

  @override
  Future<bool> validateAuthentication() async {
    try {
      log.d("Trying to validate authentication");
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
    } on AppException {
      rethrow;
    } catch (e) {
      log.e(
        "Error while fetching response for: ${EndpointUri.getValidateAuthenticationURL()}",
      );
      log.e(e);
      rethrow;
    }
  }
}
