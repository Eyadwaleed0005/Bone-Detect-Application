import 'package:bloc/bloc.dart';
import 'package:bonedetect/core/const/questions_data.dart';
import 'package:bonedetect/ui/question_screen/data/model/question_model.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'question_screen_state.dart';

class QuestionScreenCubit extends Cubit<QuestionScreenState> {
  QuestionScreenCubit() : super(QuestionScreenInitial()) {
    questions.addAll(QuestionsData.questions);
    selectedAnswers.addAll(List<String?>.filled(questions.length, null));
  }

  final PageController pageController = PageController();

  final List<QuestionModel> questions = [];
  final List<String?> selectedAnswers = [];

  int currentPage = 0;

  bool get isLastPage => currentPage == questions.length - 1;

  void onPageChanged(int newIndex) {
    if (newIndex > currentPage && selectedAnswers[currentPage] == null) {
      emit(QuestionScreenValidationError(currentPage));
      pageController.animateToPage(
        currentPage,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
      );
      return;
    }
    currentPage = newIndex;
    emit(QuestionScreenInitial());
  }

  void selectAnswer(int index, String? value) {
    selectedAnswers[index] = value;
    emit(QuestionScreenInitial());
  }

  void onNext() {
  if (selectedAnswers[currentPage] == null) {
    emit(QuestionScreenValidationError(currentPage));
    return;
  }

  if (!isLastPage) {
    currentPage++;
    pageController.animateToPage(
      currentPage,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    emit(QuestionScreenInitial());
    return;
  }

  final firstUnansweredIndex =
      selectedAnswers.indexWhere((answer) => answer == null);

  if (firstUnansweredIndex != -1) {
    currentPage = firstUnansweredIndex;
    pageController.animateToPage(
      firstUnansweredIndex,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    emit(QuestionScreenValidationError(firstUnansweredIndex));
    return;
  }
  emit(QuestionScreenCompleted(List<String?>.from(selectedAnswers)));
}

}
