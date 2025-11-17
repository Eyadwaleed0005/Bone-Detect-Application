import 'package:bonedetect/core/local/shared_preference_keys.dart';
import 'package:bonedetect/core/local/shared_preferences.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'start_screen_state.dart';

class StartScreenCubit extends Cubit<StartScreenState> {
  StartScreenCubit() : super(StartScreenInitial());
  Future<void> markAsViewed() async {
    await SharedPreferencesHelper.saveBool(
      key: SharedPreferenceKeys.startScreenViewed,
      value: true,
    );
  }
}
