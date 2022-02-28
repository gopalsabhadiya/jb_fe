import 'package:jb_fe/backend_integration/domain/repositories/user_repository.dart';
import 'package:jb_fe/backend_integration/dto/user/user_presentation.dart';

class FetchUserUseCase {
  final UserRepository repository;

  FetchUserUseCase({required this.repository});

  Future<UserPresentation> call() async {
    final userEntity = await repository.getUser();
    print("User fetched in usecase: $userEntity");
    return UserPresentation(userEntity);
  }
}
