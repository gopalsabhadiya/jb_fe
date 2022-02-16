import '../../../dto/user/user_presentation.dart';
import '../../repositories/user_repository.dart';

class FetchUserUseCase {
  final UserRepository repository;

  FetchUserUseCase({required this.repository});

  Future<UserPresentation> call() async {
    final userEntity = await repository.getUser();
    return UserPresentation(userEntity);
  }
}
