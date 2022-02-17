part of 'forgot_password_bloc.dart';

enum ForgotPasswordStatus { INITIATED, LOADING, COMPLETED, EMAIL_SENT, ERROR }

class ForgotPasswordState extends Equatable {
  final ForgotPasswordStatus status;

  const ForgotPasswordState({
    this.status = ForgotPasswordStatus.INITIATED,
  });

  ForgotPasswordState copyWith({
    ForgotPasswordStatus? status,
  }) {
    return ForgotPasswordState(
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [status];
}
