part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();
}

class Authenticate extends AuthenticationEvent {
  final LoginPresentation loginPresentation;

  const Authenticate({required this.loginPresentation});

  @override
  List<Object?> get props => [loginPresentation];
}

class ValidateAuthentication extends AuthenticationEvent {
  @override
  List<Object?> get props => [];
}

class UnAuthenticate extends AuthenticationEvent {
  @override
  List<Object?> get props => [];
}
