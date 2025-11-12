import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
part 'login_screen_state.dart';

class LoginScreenCubit extends Cubit<LoginScreenState> {
  LoginScreenCubit() : super(LoginScreenInitial());

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> login() async {
    emit(LoginScreenLoading());
    try {
      await Future.delayed(const Duration(milliseconds: 900));
      emit(LoginScreenSuccess());
    } catch (e) {
      emit(LoginScreenError('Something went wrong, please try again'));
    }
  }
  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
