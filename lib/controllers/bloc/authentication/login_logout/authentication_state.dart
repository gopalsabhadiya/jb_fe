part of 'authentication_bloc.dart';

enum AuthenticationStatus { AUTHENTICATED, UNAUTHENTICATED, LOADING, ERROR }

class AuthenticationState extends Equatable {
  final UserPresentation? user;
  final AuthenticationStatus status;

  const AuthenticationState({
    this.status = AuthenticationStatus.UNAUTHENTICATED,
    this.user,
  });

  AuthenticationState copyWith({
    AuthenticationStatus? status,
    UserPresentation? user,
  }) {
    return AuthenticationState(
      status: status ?? this.status,
      user: user ?? this.user,
    );
  }

  @override
  List<Object?> get props => [user, status];
}
