import '../../repositories/mail_repository.dart';

class ChangePasswordUseCase {
  final MailRepository repository;

  ChangePasswordUseCase({required this.repository});

  Future<bool> call({required String password, required String otp}) async {
    print("Change Password");
    return await repository.changePassword(password, otp);
  }
}
