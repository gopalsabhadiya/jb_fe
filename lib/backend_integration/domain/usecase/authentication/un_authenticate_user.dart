import '../../repositories/authentication.dart';

class UnAuthenticateUserUseCase {
  final AuthenticationRepository repository;

  UnAuthenticateUserUseCase({required this.repository});

  Future<void> call() async {
    await repository.unAuthenticateUser();
  }
}
