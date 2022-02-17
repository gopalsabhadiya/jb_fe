import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jb_fe/backend_integration/domain/usecase/authentication/authenticate_user.dart';
import 'package:jb_fe/backend_integration/dto/authentication/login_form_presentation.dart';
import 'package:jb_fe/backend_integration/dto/user/user_presentation.dart';

import '../../../../backend_integration/domain/usecase/authentication/un_authenticate_user.dart';
import '../../../../backend_integration/domain/usecase/authentication/validate_authentication.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticateUserUseCase authenticateUserUseCase;
  final UnAuthenticateUserUseCase unAuthenticateUserUseCase;
  final ValidateAuthenticationUseCase validateAuthenticationUseCase;

  AuthenticationBloc({
    required this.authenticateUserUseCase,
    required this.validateAuthenticationUseCase,
    required this.unAuthenticateUserUseCase,
  }) : super(const AuthenticationState()) {
    on<Authenticate>(_onAuthenticate);
    on<ValidateAuthentication>(_onValidateAuthentication);
    on<UnAuthenticate>(_onUnAuthenticate);
  }

  FutureOr<void> _onAuthenticate(
      Authenticate event, Emitter<AuthenticationState> emit) async {
    print("Try to authenticate user");
    emit(
      state.copyWith(
        status: AuthenticationStatus.LOADING,
      ),
    );
    try {
      final authenticatedUser =
          await authenticateUserUseCase(loginForm: event.loginPresentation);
      emit(state.copyWith(
        status: AuthenticationStatus.AUTHENTICATED,
        user: authenticatedUser,
      ));
    } catch (e) {
      print("Error caught: $e");
      emit(
        state.copyWith(
          status: AuthenticationStatus.ERROR,
        ),
      );
    }
  }

  FutureOr<void> _onValidateAuthentication(
      ValidateAuthentication event, Emitter<AuthenticationState> emit) async {
    print("Authentication validation event");
    emit(
      state.copyWith(
        status: AuthenticationStatus.LOADING,
      ),
    );
    try {
      final authenticatedUser = await validateAuthenticationUseCase();
      emit(state.copyWith(
        status: AuthenticationStatus.AUTHENTICATED,
        user: authenticatedUser,
      ));
    } catch (e) {
      print("Error caught: $e");
      emit(
        state.copyWith(
          status: AuthenticationStatus.UNAUTHENTICATED,
        ),
      );
    }
  }

  FutureOr<void> _onUnAuthenticate(
      UnAuthenticate event, Emitter<AuthenticationState> emit) async {
    emit(
      state.copyWith(
        status: AuthenticationStatus.LOADING,
      ),
    );
    await unAuthenticateUserUseCase();
    emit(
      state.copyWith(
        status: AuthenticationStatus.UNAUTHENTICATED,
      ),
    );
  }
}
