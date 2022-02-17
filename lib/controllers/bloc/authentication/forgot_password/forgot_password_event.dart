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
