import 'package:bloc/bloc.dart';
import 'package:bonedetect/core/local/shared_preference_keys.dart';
import 'package:bonedetect/core/local/shared_preferences.dart';
import 'package:flutter/foundation.dart';


part 'home_screen_state.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  HomeScreenCubit() : super(HomeScreenLoading());
  Future<void> loadUserName() async {
    emit(HomeScreenLoading());
    final userName = await SharedPreferencesHelper.getString(
      key: SharedPreferenceKeys.userName,
    );
    emit(HomeScreenLoaded(userName ?? "User"));
  }
}
