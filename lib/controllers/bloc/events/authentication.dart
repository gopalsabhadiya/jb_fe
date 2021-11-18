import 'package:jb_fe/backend_integration/dto/login.dart';

class AuthEvent {
  const AuthEvent();
}

class Authenticate extends AuthEvent {
  final LoginFormDTO loginFormDTO;

  const Authenticate({required this.loginFormDTO});
}
