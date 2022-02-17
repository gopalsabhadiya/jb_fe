import '../../repositories/authentication.dart';

class UnAuthenticateUserUseCase {
  final AuthenticationRepository repository;

  UnAuthenticateUserUseCase({required this.repository});

  Future<void> call() async {
    print("Authenticating user: Use case");
    await repository.unAuthenticateUser();
  }
}
