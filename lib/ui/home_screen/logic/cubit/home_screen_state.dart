part of 'home_screen_cubit.dart';

@immutable
sealed class HomeScreenState {}

final class HomeScreenLoading extends HomeScreenState {}

final class HomeScreenLoaded extends HomeScreenState {
  final String userName;
  HomeScreenLoaded(this.userName);
}
