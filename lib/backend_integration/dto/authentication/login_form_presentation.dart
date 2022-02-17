import 'package:jb_fe/backend_integration/domain/entities/authentication/login.dart';
import 'package:jb_fe/constants/texts/defaults.dart';

class LoginPresentation {
  late String _email;
  late String _password;

  String get email => _email;
  String get password => _password;

  void setEmail(String email) {
    _email = email;
  }

  void setPassword(String password) {
    _password = password;
  }

  LoginPresentation.empty()
      : _email = DefaultTexts.EMPTY,
        _password = DefaultTexts.EMPTY,
        super();

  LoginPresentation(LoginEntity entity)
      : _email = entity.email,
        _password = entity.password,
        super();

  LoginEntity getEntity() {
    return LoginEntity(
      email: _email,
      password: _password,
    );
  }
}
