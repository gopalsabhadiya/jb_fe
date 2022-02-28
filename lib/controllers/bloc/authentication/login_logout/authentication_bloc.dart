import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jb_fe/backend_integration/domain/usecase/authentication/authenticate_user.dart';
import 'package:jb_fe/backend_integration/domain/usecase/user/fetch_user.dart';
import 'package:jb_fe/backend_integration/dto/authentication/login_form_presentation.dart';
import 'package:jb_fe/backend_integration/dto/user/user_presentation.dart';
import 'package:jb_fe/util/extension/common_logging.dart';

import '../../../../backend_integration/domain/usecase/authentication/un_authenticate_user.dart';
import '../../../../backend_integration/domain/usecase/authentication/validate_authentication.dart';
import '../../../../util/logger.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final log = getLogger<AuthenticationBloc>();

  final AuthenticateUserUseCase authenticateUserUseCase;
  final UnAuthenticateUserUseCase unAuthenticateUserUseCase;
  final ValidateAuthenticationUseCase validateAuthenticationUseCase;
  final FetchUserUseCase fetchUserUseCase;

  AuthenticationBloc({
    required this.authenticateUserUseCase,
    required this.validateAuthenticationUseCase,
    required this.unAuthenticateUserUseCase,
    required this.fetchUserUseCase,
  }) : super(const AuthenticationState()) {
    on<Authenticate>(_onAuthenticate);
    on<ValidateAuthentication>(_onValidateAuthentication);
    on<UnAuthenticate>(_onUnAuthenticate);
  }

  FutureOr<void> _onAuthenticate(
      Authenticate event, Emitter<AuthenticationState> emit) async {
    log.logEvent<Authenticate>();
    emit(
      state.copyWith(
        status: AuthenticationStatus.LOADING,
      ),
    );
    try {
      final bool isAuthenticated =
          await authenticateUserUseCase(loginForm: event.loginPresentation);
      if (isAuthenticated) {
        final UserPresentation authenticatedUser = await fetchUserUseCase();
        emit(state.copyWith(
          status: AuthenticationStatus.AUTHENTICATED,
          user: authenticatedUser,
        ));
      } else {
        emit(state.copyWith(
          status: AuthenticationStatus.UNAUTHENTICATED,
        ));
      }
    } catch (e) {
      emit(
        state.copyWith(
          status: AuthenticationStatus.ERROR,
        ),
      );
    }
  }

  FutureOr<void> _onValidateAuthentication(
      ValidateAuthentication event, Emitter<AuthenticationState> emit) async {
    log.logEvent<ValidateAuthentication>();
    emit(
      state.copyWith(
        status: AuthenticationStatus.LOADING,
      ),
    );
    try {
      final bool isAuthenticated = await validateAuthenticationUseCase();
      log.v("Is Authenticated: $isAuthenticated");
      if (isAuthenticated) {
        final UserPresentation authenticatedUser = await fetchUserUseCase();
        emit(state.copyWith(
          status: AuthenticationStatus.AUTHENTICATED,
          user: authenticatedUser,
        ));
      } else {
        emit(state.copyWith(
          status: AuthenticationStatus.UNAUTHENTICATED,
        ));
      }
    } catch (e) {
      emit(
        state.copyWith(
          status: AuthenticationStatus.UNAUTHENTICATED,
        ),
      );
    }
  }

  FutureOr<void> _onUnAuthenticate(
      UnAuthenticate event, Emitter<AuthenticationState> emit) async {
    log.logEvent<UnAuthenticate>();
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
