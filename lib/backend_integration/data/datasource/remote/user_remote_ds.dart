import 'dart:convert';

import 'package:jb_fe/backend_integration/client/http_client.dart';
import 'package:jb_fe/backend_integration/constants/uri/endpoints.dart';
import 'package:jb_fe/backend_integration/domain/entities/user/user.dart';

abstract class UserRemoteDataSource {
  Future<UserEntity> getUser();
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final _http = AppHttpClient.getHttpClient();

  @override
  Future<UserEntity> getUser() async {
    print("Fetching response");
    try {
      final response = await _http.get(
        EndpointUri.getGetUserURL(),
        headers: {
          "content-type": "application/json",
        },
      );
      print("User fetch: ${response.statusCode} ${response.body}");
      UserEntity user = UserEntity.fromJson(
        json.decode(response.body),
      );
      return user;
    } catch (e) {
      print("Error found: $e");
      throw e;
    }
  }
}
