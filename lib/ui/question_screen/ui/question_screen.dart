import 'package:bonedetect/core/helper/spacer.dart';
import 'package:bonedetect/core/style/app_color.dart';
import 'package:bonedetect/core/widgets/app_button.dart';
import 'package:bonedetect/ui/question_screen/logic/cubit/question_screen_cubit.dart';
import 'package:bonedetect/ui/question_screen/ui/widgets/question_card.dart';
import 'package:bonedetect/ui/question_screen/ui/widgets/questions_dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_animate/flutter_animate.dart';

class QuestionScreen extends StatelessWidget {
  const QuestionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => QuestionScreenCubit(),
      child: BlocConsumer<QuestionScreenCubit, QuestionScreenState>(
        listener: (context, state) {
          if (state is QuestionScreenCompleted) {
            debugPrint("Answers: ${state.answers}");
          }
        },
        builder: (context, state) {
          final cubit = context.read<QuestionScreenCubit>();
          return Scaffold(
            body: Stack(
              children: [
                Container(color: ColorPalette.white),
                SafeArea(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        verticalSpace(75),
                        Expanded(
                          child: PageView.builder(
                            controller: cubit.pageController,
                            physics: const BouncingScrollPhysics(),
                            onPageChanged: cubit.onPageChanged,
                            itemCount: cubit.questions.length,
                            itemBuilder: (context, index) {
                              return QuestionCard(
                                question: cubit.questions[index],
                                selectedAnswer: cubit.selectedAnswers[index],
                                onChanged: (value) =>
                                    cubit.selectAnswer(index, value),
                              );
                            },
                          ),
                        ),
                        verticalSpace(16),
                        QuestionsDotsIndicator(
                          length: cubit.questions.length,
                          currentIndex: cubit.currentPage,
                        ),
                        verticalSpace(20),
                        AppButton(
                          title: cubit.isLastPage ? 'Result' : 'Next',
                          onPressed: cubit.onNext,
                        )
                            .animate()
                            .fadeIn(duration: 400.ms, delay: 150.ms)
                            .moveY(begin: 20, end: 0, duration: 400.ms),
                        verticalSpace(20),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
