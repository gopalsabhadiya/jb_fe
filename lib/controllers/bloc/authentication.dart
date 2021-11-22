import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:jb_fe/backend_integration/constants/stream/AuthenticationStatus.dart';
import 'package:jb_fe/backend_integration/dto/user/user.dart';
import 'package:jb_fe/backend_integration/repository/authenticatoin.dart';
import 'package:jb_fe/backend_integration/repository/user.dart';
import 'package:jb_fe/controllers/bloc/events/authentication.dart';
import 'package:jb_fe/controllers/bloc/state/authentication.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({
    required AuthenticationRepository authenticationRepository,
    required UserRepository userRepository,
  })  : _authenticationRepository = authenticationRepository,
        _userRepository = userRepository,
        super(const AuthenticationState.unknown()) {
    on<AuthenticationStatusChanged>(_onAuthenticationStatusChanged);
    on<AuthenticationLogoutRequested>(_onAuthenticationLogoutRequested);
    on<AuthenticationLoginRequested>(_onAuthenticationLoginRequested);
    on<AuthenticationValidationRequested>(_onAuthenticationValidationRequested);
    _authenticationStatusSubscription =
        _authenticationRepository.authStatus.listen(
      (status) => add(AuthenticationStatusChanged(status)),
    );
  }

  final AuthenticationRepository _authenticationRepository;
  final UserRepository _userRepository;
  late StreamSubscription<AuthenticationStatus>
      _authenticationStatusSubscription;

  @override
  Future<void> close() {
    _authenticationStatusSubscription.cancel();
    _authenticationRepository.dispose();
    return super.close();
  }

  void _onAuthenticationStatusChanged(
    AuthenticationStatusChanged event,
    Emitter<AuthenticationState> emit,
  ) async {
    switch (event.status) {
      case AuthenticationStatus.UNAUTHENTICATED:
        return emit(const AuthenticationState.unauthenticated());
      case AuthenticationStatus.AUTHENTICATED:
        final user = await _tryGetUser();
        return emit(user != null
            ? AuthenticationState.authenticated(user)
            : const AuthenticationState.unauthenticated());
      default:
        return emit(const AuthenticationState.unknown());
    }
  }

  void _onAuthenticationLogoutRequested(
    AuthenticationLogoutRequested event,
    Emitter<AuthenticationState> emit,
  ) {
    _authenticationRepository.logOut();
  }

  void _onAuthenticationLoginRequested(
    AuthenticationLoginRequested event,
    Emitter<AuthenticationState> emit,
  ) {
    _authenticationRepository.logIn(event.loginForm);
  }

  _onAuthenticationValidationRequested(AuthenticationValidationRequested event, Emitter<AuthenticationState> emit) {
    _authenticationRepository.validate();

  }

  Future<User?> _tryGetUser() async {
    print("Trying to get user");
    try {
      final user = await _userRepository.getUser();
      print("Your User: ${user.toString()}");
      return user;
    } catch (_) {
      return null;
    }
  }
}
