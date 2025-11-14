import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:dartz/dartz.dart';
import 'package:bonedetect/core/local/shared_preference_keys.dart';
import 'package:bonedetect/core/local/shared_preferences.dart';
import 'package:bonedetect/ui/auth_screen/login_screen/data/repo/login_repository.dart';
import 'package:bonedetect/ui/auth_screen/login_screen/data/model/login_request_model.dart';
import 'package:bonedetect/ui/auth_screen/login_screen/data/model/success_login_message_model.dart';
part 'login_screen_state.dart';

class LoginScreenCubit extends Cubit<LoginScreenState> {
  LoginScreenCubit(this._repository) : super(LoginScreenInitial());

  final LoginRepository _repository;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> login() async {
    emit(LoginScreenLoading());

    final request = LoginRequestModel(
      email: emailController.text.trim(),
      password: passwordController.text,
    );

    try {
      final Either<String, SuccessLoginMessageModel> result = await _repository
          .login(request);

      result.fold(
        (errorMessage) {
          emit(LoginScreenError(errorMessage));
        },
        (successResponse) async {
          await SharedPreferencesHelper.saveString(
            key: SharedPreferenceKeys.userName,
            value: successResponse.name,
          );

          await SharedPreferencesHelper.saveString(
            key: SharedPreferenceKeys.token,
            value: successResponse.token,
          );

          emit(LoginScreenSuccess(successResponse));
        },
      );
    } catch (e) {
      emit(LoginScreenError(e.toString()));
    }
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
