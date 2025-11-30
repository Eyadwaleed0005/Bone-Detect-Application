import 'package:bonedetect/core/helper/spacer.dart';
import 'package:bonedetect/core/routes/route_names.dart';
import 'package:bonedetect/core/style/app_color.dart';
import 'package:bonedetect/core/widgets/app_button.dart';
import 'package:bonedetect/core/widgets/custom_back_button.dart';
import 'package:bonedetect/ui/question_screen/logic/cubit/question_screen_cubit.dart';
import 'package:bonedetect/ui/question_screen/ui/widgets/question_card.dart';
import 'package:bonedetect/ui/question_screen/ui/widgets/questions_dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:easy_localization/easy_localization.dart';

class QuestionScreen extends StatelessWidget {
  const QuestionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => QuestionScreenCubit(),
      child: BlocConsumer<QuestionScreenCubit, QuestionScreenState>(
        listener: (context, state) {
          if (state is QuestionScreenCompleted) {
            Navigator.pushReplacementNamed(
              context,
              RouteNames.resultScreen,
            );
          }
        },
        builder: (context, state) {
          final cubit = context.read<QuestionScreenCubit>();
          final int? errorIndex =
              state is QuestionScreenValidationError ? state.questionIndex : null;

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
                        verticalSpace(80),
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
                                hasError: errorIndex == index,
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
                          title: cubit.isLastPage
                              ? "result".tr()
                              : "next".tr(),
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
                const CustomBackButton(),
              ],
            ),
          );
        },
      ),
    );
  }
}
