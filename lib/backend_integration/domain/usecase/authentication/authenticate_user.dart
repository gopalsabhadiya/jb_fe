import 'package:jb_fe/backend_integration/dto/authentication/login_form_presentation.dart';
import 'package:jb_fe/backend_integration/dto/user/user_presentation.dart';

import '../../repositories/authentication.dart';

class AuthenticateUserUseCase {
  final AuthenticationRepository repository;

  AuthenticateUserUseCase({required this.repository});

  Future<UserPresentation> call({required LoginPresentation loginForm}) async {
    print("Authenticating user: Use case");
    final userEntity = await repository.authenticateUser(loginForm.getEntity());
    return UserPresentation(userEntity);
  }
}
