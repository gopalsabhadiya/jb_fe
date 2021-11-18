import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:jb_fe/backend_integration/api/auth.dart';
import 'package:jb_fe/backend_integration/dto/login.dart';
import 'package:jb_fe/backend_integration/dto/responses/auth_response.dart';
import 'package:jb_fe/backend_integration/utils/storage/shared_preference.dart';
import 'package:jb_fe/controllers/bloc/events/authentication.dart';
import 'package:jb_fe/controllers/bloc/state/authentication.dart';

class AuthenticationBloc extends Bloc<AuthEvent, AuthenticationState> {
  AuthenticationBloc(AuthenticationState initialState) : super(initialState);

  AuthenticationState get initialState {
    return AuthenticationState.INITIAL;
  }

  @override
  Stream<AuthenticationState> mapEventToState(AuthEvent event) async* {
    if (event is Authenticate) {
      yield AuthenticationState.LOADING;
      LoginFormDTO loginFormDTO = LoginFormDTO();
      loginFormDTO.email = "gopal.sabhadiya@gmail.com";
      loginFormDTO.password = "123456";
      try {
        final response = await AuthenticationAPI.authenticateUser(loginFormDTO);
        final AuthResponse authResponse =
            AuthResponse.fromJson(json.decode(response.body));
        AppSharedPreference.saveString(key: "csrf", value: authResponse.token);
        yield AuthenticationState.SUCCESS;
      } catch (error) {
        yield AuthenticationState.FAILURE;
      }
    }
  }
}
