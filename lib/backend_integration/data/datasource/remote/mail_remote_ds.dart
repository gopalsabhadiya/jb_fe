import 'dart:convert';

import 'package:jb_fe/backend_integration/client/http_client.dart';

import '../../../../util/logger.dart';
import '../../../constants/uri/endpoints.dart';

abstract class MailRemoteDataSource {
  Future<bool> sendOTPMail(String email);
  Future<bool> verifyOTP(String otp);
  Future<bool> changePassword(String password, String otp);
}

class MailRemoteDataSourceImpl implements MailRemoteDataSource {
  final log = getLogger<MailRemoteDataSourceImpl>();

  final _http = AppHttpClient.getHttpClient();

  @override
  Future<bool> sendOTPMail(String email) async {
    final Map<String, String> payload = {"email": email};
    final response = await _http.post(
      EndpointUri.getSendOTPMailURL(),
      body: jsonEncode(payload),
      headers: {
        "content-type": "application/json",
      },
    );
    print("Send mail response: ${response.body}");
    return response.statusCode == 200;
  }

  @override
  Future<bool> verifyOTP(String otp) async {
    final Map<String, String> payload = {"otp": otp};
    final response = await _http.post(
      EndpointUri.getVerifyOTPURL(),
      body: jsonEncode(payload),
      headers: {
        "content-type": "application/json",
      },
    );
    print("Response: ${response.body}");
    return response.statusCode == 200;
  }

  @override
  Future<bool> changePassword(String password, String otp) async {
    final Map<String, String> payload = {"password": password, "otp": otp};
    print("Payload: $payload");
    final response = await _http.post(
      EndpointUri.getChangePasswordURL(),
      body: jsonEncode(payload),
      headers: {
        "content-type": "application/json",
      },
    );
    print("Response: ${response.body}");
    return response.statusCode == 200;
  }
}
