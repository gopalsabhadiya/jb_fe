import 'dart:async';
import 'dart:convert';

import 'package:jb_fe/backend_integration/api/auth.dart';
import 'package:jb_fe/backend_integration/constants/stream/AuthenticationStatus.dart';
import 'package:jb_fe/backend_integration/dto/login.dart';
import 'package:jb_fe/backend_integration/dto/responses/auth_response.dart';
import 'package:jb_fe/backend_integration/utils/storage/shared_preference.dart';
import 'package:jb_fe/injection_container.dart';

class AuthenticationRepository {
  final _controller = StreamController<AuthenticationStatus>();
  AuthenticationAPI api = AuthenticationAPI();

  Stream<AuthenticationStatus> get authStatus async* {
    yield AuthenticationStatus.UNKNOWN;
    yield* _controller.stream;
  }

  Future<void> logIn(LoginFormDTO loginForm) async {
    _controller.add(AuthenticationStatus.LOADING);
    final response = await api.authenticateUser(loginForm);
    final authResponse = AuthResponse.fromJson(json.decode(response.body));
    serviceLocator<AppSharedPreference>()
        .saveString(key: "csrf", value: authResponse.token);
    _controller.add(AuthenticationStatus.AUTHENTICATED);
  }

  void logOut() async {
    await serviceLocator<AppSharedPreference>().deleteString(key: "csrf");
    _controller.add(AuthenticationStatus.UNAUTHENTICATED);
  }

  void validate() async {
    _controller.add(AuthenticationStatus.LOADING);
    final String _csrfToken =
        await serviceLocator<AppSharedPreference>().getString(key: "csrf");
    final isValid = await api.validateAuthentication();

    if (isValid) {
      _controller.add(AuthenticationStatus.AUTHENTICATED);
    } else {
      _controller.add(AuthenticationStatus.UNAUTHENTICATED);
    }
  }

  void dispose() => _controller.close();
}
