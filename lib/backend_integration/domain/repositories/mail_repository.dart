abstract class MailRepository {
  Future<bool> sendOTPMail(String email);
  Future<bool> verifyOTP(String otp);
  Future<bool> changePassword(String password, String otp);
}
