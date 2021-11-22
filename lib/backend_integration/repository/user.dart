import 'package:jb_fe/backend_integration/dto/user/user.dart';

class UserRepository {
  User? _user;

  Future<User?> getUser() async {
    if (_user != null) {
      return _user;
    }
    return User("Gopal", "g@gmail.com", "Business: Coder", true);
  }
}
