import '../../../util/logger.dart';
import '../../domain/repositories/mail_repository.dart';
import '../datasource/remote/mail_remote_ds.dart';

class MailRepositoryImpl implements MailRepository {
  final log = getLogger<MailRepositoryImpl>();

  final MailRemoteDataSource remoteDataSource;

  MailRepositoryImpl({required this.remoteDataSource});

  @override
  Future<bool> sendOTPMail(String email) async {
    log.d("Sending OTP Mail");
    return await remoteDataSource.sendOTPMail(email);
  }

  @override
  Future<bool> verifyOTP(String otp) async {
    log.d("Verifying OTP");
    return await remoteDataSource.verifyOTP(otp);
  }

  @override
  Future<bool> changePassword(String password, String otp) async {
    log.d("Changing password");
    return await remoteDataSource.changePassword(password, otp);
  }
}
