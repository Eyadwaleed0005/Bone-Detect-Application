part of 'login_screen_cubit.dart';

sealed class LoginScreenState {}

final class LoginScreenInitial extends LoginScreenState {}

final class LoginScreenLoading extends LoginScreenState {}

final class LoginScreenSuccess extends LoginScreenState {}

final class LoginScreenError extends LoginScreenState {
  final String message;
  LoginScreenError(this.message);
}
