import '../../repositories/mail_repository.dart';

class VerifyOTPUseCase {
  final MailRepository repository;

  VerifyOTPUseCase({required this.repository});

  Future<bool> call({required String otp}) async {
    print("Verify OTP");
    return await repository.verifyOTP(otp);
  }
}
