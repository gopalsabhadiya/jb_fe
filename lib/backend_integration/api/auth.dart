import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:jb_fe/backend_integration/client/http_client.dart';
import 'package:jb_fe/backend_integration/constants/uri/endpoints.dart';
import 'package:jb_fe/backend_integration/dto/login.dart';
import 'package:jb_fe/backend_integration/dto/responses/auth_response.dart';
import 'package:jb_fe/backend_integration/utils/errors/csrf_invalid_exception.dart';
import 'package:jb_fe/backend_integration/utils/storage/shared_preference.dart';

class AuthenticationAPI {
  static final _http = AppHttpClient.getHttpClient();

  static Future<http.Response> authenticateUser(LoginFormDTO user) {
    return _http.post(EndpointUri.getAuthenticateURL(),
        headers: {"content-type": "application/json"},
        body: jsonEncode(user.toJson()));
  }

  static Future<http.Response> validateAuthentication() async {
    final String csrfToken = await AppSharedPreference.getString(key: "csrf");
    if (csrfToken.isNotEmpty) {
      print("CSRFTOKEN: $csrfToken");
      AuthResponse authResponse = AuthResponse(csrfToken, false);
      return _http.post(EndpointUri.getValidateAuthenticationURL(),
          headers: {"content-type": "application/json"},
          body: jsonEncode(authResponse.toJson()));
    }
    return Future.error(CsrfInvalidException("CSRF token not found"));
  }
}
