part of 'question_screen_cubit.dart';

@immutable
sealed class QuestionScreenState {}

final class QuestionScreenInitial extends QuestionScreenState {}

final class QuestionScreenCompleted extends QuestionScreenState {
  final List<String?> answers;
  QuestionScreenCompleted(this.answers);
}

final class QuestionScreenValidationError extends QuestionScreenState {
  final int questionIndex;
  QuestionScreenValidationError(this.questionIndex);
}
