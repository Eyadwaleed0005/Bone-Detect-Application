part of 'login_screen_cubit.dart';

abstract class LoginScreenState {}

class LoginScreenInitial extends LoginScreenState {}

class LoginScreenLoading extends LoginScreenState {}

class LoginScreenSuccess extends LoginScreenState {
  final SuccessLoginMessageModel response;

  LoginScreenSuccess(this.response);
}

class LoginScreenError extends LoginScreenState {
  final String message;

  LoginScreenError(this.message);
}
