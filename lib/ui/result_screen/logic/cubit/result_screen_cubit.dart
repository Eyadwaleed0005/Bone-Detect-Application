import 'package:bloc/bloc.dart';
import 'package:bonedetect/core/local/shared_preference_keys.dart';
import 'package:bonedetect/core/local/shared_preferences.dart';
import 'package:meta/meta.dart';
part 'result_screen_state.dart';

class ResultScreenCubit extends Cubit<ResultScreenState> {
  ResultScreenCubit() : super(const ResultScreenInitial());

  Future<void> loadPrediction() async {
    final storedIsFractured = await SharedPreferencesHelper.getBool(
      key: SharedPreferenceKeys.isFractured,
    );

    final storedConfidence = await SharedPreferencesHelper.getDouble(
      key: SharedPreferenceKeys.confidence,
    );

    final storedSummary = await SharedPreferencesHelper.getString(
      key: SharedPreferenceKeys.visionSummary,
    );

    final isFractured = storedIsFractured ?? false;
    final confidence = storedConfidence ?? 0.0;

    emit(
      ResultScreenLoaded(
        isFractured: isFractured,
        confidence: confidence,
        visionSummary: storedSummary,
      ),
    );
  }
}
