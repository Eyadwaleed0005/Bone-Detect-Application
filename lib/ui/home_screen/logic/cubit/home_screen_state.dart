part of 'home_screen_cubit.dart';

@immutable
abstract class HomeScreenState {}

class HomeScreenInitial extends HomeScreenState {}

class HomeScreenLoading extends HomeScreenState {}

class HomeScreenLoaded extends HomeScreenState {
  final String userName;
  HomeScreenLoaded(this.userName);
}

class HomeScreenShowPreview extends HomeScreenState {
  final File imageFile;
  HomeScreenShowPreview(this.imageFile);
}

class HomeScreenPredictionLoading extends HomeScreenState {}

class HomeScreenPredictionSuccess extends HomeScreenState {
  final FractureResultModel result;
  HomeScreenPredictionSuccess(this.result);
}

class HomeScreenPredictionError extends HomeScreenState {
  final String message;
  HomeScreenPredictionError(this.message);
}

class HomeScreenLogoutSuccess extends HomeScreenState {}

class HomeScreenLanguageChanged extends HomeScreenState {
  final Locale newLocale;
  HomeScreenLanguageChanged(this.newLocale);
}