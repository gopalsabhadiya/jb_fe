import '../../../dto/user/user_presentation.dart';
import '../../repositories/authentication.dart';

class ValidateAuthenticationUseCase {
  final AuthenticationRepository repository;

  ValidateAuthenticationUseCase({required this.repository});

  Future<UserPresentation> call() async {
    print("Authenticating user: Use case");
    final userEntity = await repository.validateAuthentication();
    return UserPresentation(userEntity);
  }
}
