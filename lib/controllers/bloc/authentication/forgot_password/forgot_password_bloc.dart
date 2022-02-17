import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'forgot_password_event.dart';
part 'forgot_password_state.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  ForgotPasswordBloc() : super(const ForgotPasswordState()) {
    on<SendOTPMail>(_onSentOTPMail);
  }

  FutureOr<void> _onSentOTPMail(
    SendOTPMail event,
    Emitter<ForgotPasswordState> emit,
  ) async {
    print("Sned mail: ${event.email}");
  }
}
