import 'package:bloc/bloc.dart';
import 'package:bonedetect/core/const/questions_data.dart';
import 'package:bonedetect/ui/question_screen/data/model/question_model.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'question_screen_state.dart';

class QuestionScreenCubit extends Cubit<QuestionScreenState> {
  QuestionScreenCubit() : super(QuestionScreenInitial()) {
    _init();
  }
  final List<QuestionModel> questions = QuestionsData.questions;
  final PageController pageController = PageController();
  int currentPage = 0;
  late List<String?> selectedAnswers;
  bool get isLastPage => currentPage == questions.length - 1;
  void _init() {
    selectedAnswers = List<String?>.filled(questions.length, null);
  }
  void selectAnswer(int index, String? value) {
    selectedAnswers[index] = value;
    emit(QuestionScreenUpdated());
  }
  void onPageChanged(int index) {
    currentPage = index;
    emit(QuestionScreenUpdated());
  }
  void onNext() {
    if (selectedAnswers[currentPage] == null) return;

    if (isLastPage) {
      emit(QuestionScreenCompleted(selectedAnswers));
    } else {
      pageController.nextPage(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOut,
      );
    }
  }
}
