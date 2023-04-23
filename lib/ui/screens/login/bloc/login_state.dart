part of 'login_bloc.dart';

enum LoginStatus { initial, success, error, loading, data }

extension LoginStatusX on LoginStatus {
  bool get isInitial => this == LoginStatus.initial;

  bool get isSuccess => this == LoginStatus.success;

  bool get isError => this == LoginStatus.error;

  bool get isLoading => this == LoginStatus.loading;

  bool get isData => this == LoginStatus.data;
}

class LoginState extends Equatable {
  final LoginStatus status;
  final Login? login;
  final String email;
  final String password;

  const LoginState({
    this.status = LoginStatus.initial,
    this.login,
    this.email = '',
    this.password = '',
  });

  @override
  List<Object?> get props => [status, login, email, password];

  LoginState copyWith({
    LoginStatus? status,
    Login? login,
    String? email,
    String? password,
  }) {
    return LoginState(
      status: status ?? this.status,
      login: login ?? this.login,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
