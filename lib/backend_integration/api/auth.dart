import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:jb_fe/backend_integration/client/http_client.dart';
import 'package:jb_fe/backend_integration/constants/uri/endpoints.dart';
import 'package:jb_fe/backend_integration/dto/login.dart';
import 'package:jb_fe/backend_integration/dto/responses/auth_response.dart';
import 'package:jb_fe/backend_integration/utils/storage/shared_preference.dart';

class AuthenticationAPI {
  static final AuthenticationAPI _singleton = AuthenticationAPI._internal();
  factory AuthenticationAPI() {
    return _singleton;
  }
  AuthenticationAPI._internal();

  final _http = AppHttpClient.getHttpClient();

  Future<http.Response> authenticateUser(LoginFormDTO user) {
    return _http.post(EndpointUri.getAuthenticateURL(),
        headers: {"content-type": "application/json"},
        body: jsonEncode(user.toJson()));
  }

  Future<bool> validateAuthentication() async {
    final String csrfToken = await AppSharedPreference.getString(key: "csrf");
    if (csrfToken.isNotEmpty) {
      AuthResponse authResponse = AuthResponse(csrfToken, false);
      final response = await _http.post(
          EndpointUri.getValidateAuthenticationURL(),
          headers: {"content-type": "application/json"},
          body: jsonEncode(authResponse.toJson()));
      print("Response: ${response.headers['set-cookie']}");
      if (response.statusCode == 200) {
        return true;
      }
    }
    return false;
  }
}
