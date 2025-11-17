part of 'splash_screen_cubit.dart';

@immutable
sealed class SplashScreenState {}

final class SplashScreenInitial extends SplashScreenState {}

final class SplashScreenLoading extends SplashScreenState {}

final class SplashScreenHasToken extends SplashScreenState {}

final class SplashScreenNoToken extends SplashScreenState {}

final class SplashShowStartScreen extends SplashScreenState {}

