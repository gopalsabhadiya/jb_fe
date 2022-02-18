import '../../domain/repositories/mail_repository.dart';
import '../datasource/remote/mail_remote_ds.dart';

class MailRepositoryImpl implements MailRepository {
  final MailRemoteDataSource remoteDataSource;

  MailRepositoryImpl({required this.remoteDataSource});

  @override
  Future<bool> sendOTPMail(String email) async {
    print("Send OTP Mail");
    return await remoteDataSource.sendOTPMail(email);
  }

  @override
  Future<bool> verifyOTP(String otp) async {
    print("Verify OTP Mail");
    return await remoteDataSource.verifyOTP(otp);
  }

  @override
  Future<bool> changePassword(String password, String otp) async {
    print("Change Password");
    return await remoteDataSource.changePassword(password, otp);
  }
}
