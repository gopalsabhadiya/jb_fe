import 'dart:convert';

import 'package:jb_fe/backend_integration/client/http_client.dart';

import '../../../../util/exceptions/app_exception.dart';
import '../../../../util/logger.dart';
import '../../../constants/uri/endpoints.dart';
import '../../../utils/header_utils.dart';

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
    try {
      final Map<String, String> payload = {"email": email};
      final response = await _http.post(
        EndpointUri.getSendOTPMailURL(),
        body: jsonEncode(payload),
        headers: HeaderUtils.getHeader(),
      );
      return response.statusCode == 200;
    } on AppException {
      rethrow;
    } catch (e) {
      log.e(
        "Error while fetching response for: ${EndpointUri.getSendOTPMailURL()}",
      );
      log.e(e);
      rethrow;
    }
  }

  @override
  Future<bool> verifyOTP(String otp) async {
    try {
      final Map<String, String> payload = {"otp": otp};
      final response = await _http.post(
        EndpointUri.getVerifyOTPURL(),
        body: jsonEncode(payload),
        headers: HeaderUtils.getHeader(),
      );
      return response.statusCode == 200;
    } on AppException {
      rethrow;
    } catch (e) {
      log.e(
        "Error while fetching response for: ${EndpointUri.getVerifyOTPURL()}",
      );
      log.e(e);
      rethrow;
    }
  }

  @override
  Future<bool> changePassword(String password, String otp) async {
    try {
      final Map<String, String> payload = {"password": password, "otp": otp};
      final response = await _http.post(
        EndpointUri.getChangePasswordURL(),
        body: jsonEncode(payload),
        headers: HeaderUtils.getHeader(),
      );
      print("Response: ${response.body}");
      return response.statusCode == 200;
    } on AppException {
      rethrow;
    } catch (e) {
      log.e(
        "Error while fetching response for: ${EndpointUri.getChangePasswordURL()}",
      );
      log.e(e);
      rethrow;
    }
  }
}
