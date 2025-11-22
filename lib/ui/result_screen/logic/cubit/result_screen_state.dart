part of 'result_screen_cubit.dart';

@immutable
sealed class ResultScreenState {
  const ResultScreenState();
}

final class ResultScreenInitial extends ResultScreenState {
  const ResultScreenInitial();
}

final class ResultScreenLoaded extends ResultScreenState {
  final bool isFractured;
  final double confidence;
  final String? visionSummary;

  const ResultScreenLoaded({
    required this.isFractured,
    required this.confidence,
    this.visionSummary,
  });
}
