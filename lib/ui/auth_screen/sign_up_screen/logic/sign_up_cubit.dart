import 'package:bloc/bloc.dart';
import 'package:bonedetect/core/local/secure_storage.dart';
import 'package:bonedetect/core/local/secure_storage_keys.dart';
import 'package:bonedetect/core/local/shared_preference_keys.dart';
import 'package:bonedetect/core/local/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:bonedetect/ui/auth_screen/sign_up_screen/data/repo/sign_up_repository.dart';
import 'package:bonedetect/ui/auth_screen/sign_up_screen/data/model/sign_up_request_model.dart';
import 'package:bonedetect/ui/auth_screen/sign_up_screen/data/model/success_register_message_model.dart';
import 'package:dartz/dartz.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this._repository) : super(SignUpInitial());

  final SignUpRepository _repository;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> signUp() async {
    emit(SignUpLoading());
    final request = SignUpRequestModel(
      name: nameController.text.trim(),
      email: emailController.text.trim(),
      password: passwordController.text,
    );

    try {
      final Either<String, SuccessRegisterMessageModel> result =
          await _repository.signUp(request);
      result.fold(
        (errorMessage) {
          emit(SignUpError(errorMessage));
        },
        (successResponse) async {
          await SharedPreferencesHelper.saveString(
            key: SharedPreferenceKeys.userName,
            value: request.name,
          );
         await SecureStorageHelper.savedata(
            key: SecureStorageKeys.token,
            value: successResponse.token,
          );
          emit(SignUpSuccess(successResponse));
        },
      );
    } catch (e) {
      emit(SignUpError(e.toString()));
    }
  }

  @override
  Future<void> close() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
