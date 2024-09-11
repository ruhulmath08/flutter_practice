part of 'login_bloc.dart';

enum LoginStateStatus { initial, loading, success, failed }

class LoginState extends Equatable {
  final String username;
  final String password;
  final String loginFailedMessage;
  final LoginStateStatus loginStateStatus;

  const LoginState({
    this.username = 'emilys',
    this.password = 'emilyspass',
    this.loginFailedMessage = '',
    this.loginStateStatus = LoginStateStatus.initial,
  });

  LoginState copyWith({
    String? username,
    String? password,
    String? loginFailedMessage,
    LoginStateStatus? loginStateStatus,
  }) {
    return LoginState(
      username: username ?? this.username,
      password: password ?? this.password,
      loginFailedMessage: loginFailedMessage ?? this.loginFailedMessage,
      loginStateStatus: loginStateStatus ?? this.loginStateStatus,
    );
  }

  @override
  List<Object?> get props => [
        username,
        password,
        loginFailedMessage,
        loginStateStatus,
      ];
}
