part of 'forgot_password_bloc.dart';

abstract class ForgotPasswordEvent extends Equatable {
  const ForgotPasswordEvent();
}

class SendOTPMail extends ForgotPasswordEvent {
  final String email;

  const SendOTPMail({required this.email});

  @override
  List<Object?> get props => [email];
}

class VerifyOTP extends ForgotPasswordEvent {
  final String otp;

  const VerifyOTP({required this.otp});

  @override
  List<Object?> get props => [otp];
}

class ChangePassword extends ForgotPasswordEvent {
  final String password;

  const ChangePassword({required this.password});

  @override
  List<Object?> get props => [password];
}
