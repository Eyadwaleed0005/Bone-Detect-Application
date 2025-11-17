import 'package:bloc/bloc.dart';
import 'package:bonedetect/core/local/secure_storage.dart';
import 'package:bonedetect/core/local/secure_storage_keys.dart';
import 'package:bonedetect/core/local/shared_preference_keys.dart';
import 'package:bonedetect/core/local/shared_preferences.dart';
import 'package:meta/meta.dart';

part 'splash_screen_state.dart';

class SplashScreenCubit extends Cubit<SplashScreenState> {
  SplashScreenCubit() : super(SplashScreenInitial());

  Future<void> checkToken() async {
    emit(SplashScreenLoading());

    await Future.delayed(const Duration(seconds: 2));

    bool viewed =
        await SharedPreferencesHelper.getBool(
          key: SharedPreferenceKeys.startScreenViewed,
        ) ??
        false;

    if (!viewed) {
      emit(SplashShowStartScreen());
      return;
    }
    String? token = await SecureStorageHelper.getdata(
      key: SecureStorageKeys.token,
    );
    if (token != null && token.isNotEmpty) {
      emit(SplashScreenHasToken());
    } else {
      emit(SplashScreenNoToken());
    }
  }
}
