import 'dart:convert';

import 'package:jb_fe/backend_integration/client/http_client.dart';
import 'package:jb_fe/backend_integration/constants/uri/endpoints.dart';
import 'package:jb_fe/backend_integration/domain/entities/user/user.dart';

import '../../../../util/exceptions/app_exception.dart';
import '../../../../util/logger.dart';
import '../../../utils/header_utils.dart';

abstract class UserRemoteDataSource {
  Future<UserEntity> getUser();
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final log = getLogger<UserRemoteDataSourceImpl>();

  final _http = AppHttpClient.getHttpClient();

  @override
  Future<UserEntity> getUser() async {
    try {
      final response = await _http.get(
        EndpointUri.getGetUserURL(),
        headers: HeaderUtils.getHeader(),
      );
      UserEntity user = UserEntity.fromJson(
        json.decode(response.body),
      );
      return user;
    } on AppException {
      rethrow;
    } catch (e) {
      log.e(
        "Error while fetching response for: ${EndpointUri.getGetUserURL()}",
      );
      log.e(e);
      rethrow;
    }
  }
}
