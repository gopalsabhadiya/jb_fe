import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:jb_fe/backend_integration/client/http_client.dart';
import 'package:jb_fe/backend_integration/constants/uri/endpoints.dart';
import 'package:jb_fe/backend_integration/dto/login.dart';
import 'package:jb_fe/backend_integration/dto/responses/auth_response.dart';
import 'package:jb_fe/backend_integration/utils/storage/shared_preference.dart';

class AuthenticationAPI {
  static final _http = AppHttpClient.getHttpClient();

  static Future<http.Response> authenticateUser(LoginFormDTO user) {
    return _http.post(EndpointUri.getAuthenticateURL(),
        headers: {"content-type": "application/json"},
        body: jsonEncode(user.toJson()));
  }

  static Future<bool> validateAuthentication() async {
    final String csrfToken = await AppSharedPreference.getString(key: "csrf");
    if (csrfToken.isNotEmpty) {
      AuthResponse authResponse = AuthResponse(csrfToken, false);
      final response = await _http.post(
          EndpointUri.getValidateAuthenticationURL(),
          headers: {"content-type": "application/json"},
          body: jsonEncode(authResponse.toJson()));
      if (response.statusCode == 200) {
        return true;
      }
    }
    return false;
  }
}
