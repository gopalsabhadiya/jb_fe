import '../../repositories/authentication.dart';

class ValidateAuthenticationUseCase {
  final AuthenticationRepository repository;

  ValidateAuthenticationUseCase({required this.repository});

  Future<bool> call() async {
    return await repository.validateAuthentication();
  }
}
