import 'package:meta/meta.dart';

@immutable
class OnBordingScreenState {
  final int index;
  final OnbAction action;

  const OnBordingScreenState({
    required this.index,
    this.action = OnbAction.none,
  });

  OnBordingScreenState copyWith({int? index, OnbAction? action}) {
    return OnBordingScreenState(
      index: index ?? this.index,
      action: action ?? OnbAction.none,
    );
  }
}

enum OnbAction { none, navigateLogin }
