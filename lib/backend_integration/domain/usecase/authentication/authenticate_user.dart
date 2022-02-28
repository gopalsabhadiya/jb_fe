import 'package:jb_fe/backend_integration/dto/authentication/login_form_presentation.dart';

import '../../repositories/authentication.dart';

class AuthenticateUserUseCase {
  final AuthenticationRepository repository;

  AuthenticateUserUseCase({required this.repository});

  Future<bool> call({required LoginPresentation loginForm}) async {
    return await repository.authenticateUser(loginForm.getEntity());
  }
}
