part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {
  final LoginResponse loginResponse;

  LoginSuccess({required this.loginResponse});

  List<Object> get props => [loginResponse];
}

final class LoginFailure extends LoginState {
  final String errMsg;

  LoginFailure({required this.errMsg});
}
