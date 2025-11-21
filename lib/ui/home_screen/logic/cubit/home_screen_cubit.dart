import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:bonedetect/core/local/shared_preference_keys.dart';
import 'package:bonedetect/core/local/shared_preferences.dart';
import 'package:bonedetect/ui/home_screen/data/model/fracture_result_model.dart';
import 'package:bonedetect/ui/home_screen/data/repo/fracture_result_repo.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
part 'home_screen_state.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  HomeScreenCubit() : super(HomeScreenInitial());

  String _userName = 'User';
  String get userName => _userName;

  final FractureResultRepo _repo = FractureResultRepo();

  File? _lastImageFile;
  File? get lastImageFile => _lastImageFile;

  Future<void> loadUserName() async {
    emit(HomeScreenLoading());
    final storedName = await SharedPreferencesHelper.getString(
      key: SharedPreferenceKeys.userName,
    );
    _userName = storedName ?? "User";
    emit(HomeScreenLoaded(_userName));
  }

  Future<void> pickFromGallery() async {
    final picker = ImagePicker();
    final XFile? picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked == null) return;
    emit(HomeScreenShowPreview(File(picked.path)));
  }

  Future<void> pickFromCamera() async {
    final picker = ImagePicker();
    final XFile? picked = await picker.pickImage(source: ImageSource.camera);
    if (picked == null) return;
    emit(HomeScreenShowPreview(File(picked.path)));
  }

  Future<void> sendImageForPrediction(File imageFile) async {
    _lastImageFile = imageFile;
    emit(HomeScreenPredictionLoading());

    final result = await _repo.predictFracture(imageFile: imageFile);

    result.fold(
      (errorMessage) {
        emit(HomeScreenPredictionError(errorMessage));
      },
      (FractureResultModel model) async {
        await SharedPreferencesHelper.saveDouble(
          key: SharedPreferenceKeys.fractureProbability,
          value: model.fractureProbability,
        );
        emit(HomeScreenPredictionSuccess(model.fractureProbability));
      },
    );
  }
}
