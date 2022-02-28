import 'package:http/http.dart' as http;
import 'package:jb_fe/util/exceptions/api_exception/invalid_login_creds.dart';

class AuthenticationResponseValidation {
  static validateAuthenticateUserResponse(
      String email, http.Response response) {
    if (response.statusCode == 400) {
      throw InvalidLoginCreds(email: email);
    }
  }
}
