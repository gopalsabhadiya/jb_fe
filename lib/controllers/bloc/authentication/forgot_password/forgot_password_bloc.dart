import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jb_fe/backend_integration/domain/usecase/mail/send_otp_mail.dart';

import '../../../../backend_integration/domain/usecase/mail/change_password.dart';
import '../../../../backend_integration/domain/usecase/mail/verify_otp.dart';

part 'forgot_password_event.dart';
part 'forgot_password_state.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  final SendOTPMailUseCase sendOTPMailUseCase;
  final VerifyOTPUseCase verifyOtpUseCase;
  final ChangePasswordUseCase changePasswordUseCase;

  ForgotPasswordBloc({
    required this.sendOTPMailUseCase,
    required this.verifyOtpUseCase,
    required this.changePasswordUseCase,
  }) : super(const ForgotPasswordState()) {
    on<SendOTPMail>(_onSentOTPMail);
    on<VerifyOTP>(_onVerifyOTP);
    on<ChangePassword>(_onChangePassword);
  }

  FutureOr<void> _onSentOTPMail(
    SendOTPMail event,
    Emitter<ForgotPasswordState> emit,
  ) async {
    try {
      emit(
        state.copyWith(
          status: ForgotPasswordStatus.LOADING,
          email: event.email,
        ),
      );
      final mailSent = await sendOTPMailUseCase(email: event.email);
      print("Mail Sent? : $mailSent");
      if (mailSent) {
        emit(
          state.copyWith(
            status: ForgotPasswordStatus.VERIFY_OTP,
          ),
        );
      } else {
        emit(
          state.copyWith(
            status: ForgotPasswordStatus.FAILED_TO_SEND_OTP,
          ),
        );
      }
    } catch (e) {
      print("Error while verifying otp: ${e}");
      emit(
        state.copyWith(
          status: ForgotPasswordStatus.FAILED_TO_SEND_OTP,
        ),
      );
    }
  }

  FutureOr<void> _onVerifyOTP(
      VerifyOTP event, Emitter<ForgotPasswordState> emit) async {
    try {
      emit(
        state.copyWith(
          status: ForgotPasswordStatus.LOADING,
          otp: event.otp,
        ),
      );
      final mailSent = await verifyOtpUseCase(otp: event.otp);
      if (mailSent) {
        emit(
          state.copyWith(
            status: ForgotPasswordStatus.CHANGE_PASSWORD,
          ),
        );
      } else {
        emit(
          state.copyWith(
            status: ForgotPasswordStatus.INCORRECT_OTP,
          ),
        );
      }
    } catch (e) {
      print("Error while verifying otp: ${e}");
      emit(
        state.copyWith(
          status: ForgotPasswordStatus.INCORRECT_OTP,
        ),
      );
    }
  }

  FutureOr<void> _onChangePassword(
      ChangePassword event, Emitter<ForgotPasswordState> emit) async {
    try {
      final mailSent = await changePasswordUseCase(
        password: event.password,
        otp: state.otp!,
      );
      if (mailSent) {
        emit(
          state.copyWith(
            status: ForgotPasswordStatus.COMPLETED,
          ),
        );
      } else {
        emit(
          state.copyWith(
            status: ForgotPasswordStatus.ERROR,
          ),
        );
      }
    } catch (e) {
      print("Error while verifying otp: ${e}");
      emit(
        state.copyWith(
          status: ForgotPasswordStatus.ERROR,
        ),
      );
    }
  }
}
