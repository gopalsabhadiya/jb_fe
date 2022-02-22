part of 'forgot_password_bloc.dart';

enum ForgotPasswordStatus {
  INITIATED,
  FAILED_TO_SEND_OTP,
  LOADING,
  COMPLETED,
  VERIFY_OTP,
  INCORRECT_OTP,
  CHANGE_PASSWORD,
  ERROR
}

class ForgotPasswordState extends Equatable {
  final ForgotPasswordStatus status;
  final String? email;
  final String? otp;

  const ForgotPasswordState({
    this.status = ForgotPasswordStatus.INITIATED,
    this.email,
    this.otp,
  });

  ForgotPasswordState copyWith({
    ForgotPasswordStatus? status,
    String? email,
    String? otp,
  }) {
    return ForgotPasswordState(
      status: status ?? this.status,
      email: email ?? this.email,
      otp: otp ?? this.otp,
    );
  }

  @override
  List<Object?> get props => [status];
}
