part of 'home_screen_cubit.dart';

@immutable
sealed class HomeScreenState {}

final class HomeScreenInitial extends HomeScreenState {}

final class HomeScreenLoading extends HomeScreenState {}

final class HomeScreenLoaded extends HomeScreenState {
  final String userName;
  HomeScreenLoaded(this.userName);
}

final class HomeScreenShowPreview extends HomeScreenState {
  final File imageFile;
  HomeScreenShowPreview(this.imageFile);
}

final class HomeScreenPredictionLoading extends HomeScreenState {}

final class HomeScreenPredictionSuccess extends HomeScreenState {
  final double fractureProbability;
  HomeScreenPredictionSuccess(this.fractureProbability);
}

final class HomeScreenPredictionError extends HomeScreenState {
  final String message;
  HomeScreenPredictionError(this.message);
}
