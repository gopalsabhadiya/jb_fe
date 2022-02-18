import 'package:jb_fe/backend_integration/domain/repositories/mail_repository.dart';

class SendOTPMailUseCase {
  final MailRepository repository;

  SendOTPMailUseCase({required this.repository});

  Future<bool> call({required String email}) async {
    print("Send OTP mail");
    return await repository.sendOTPMail(email);
  }
}
