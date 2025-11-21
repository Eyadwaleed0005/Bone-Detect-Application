import 'package:bonedetect/core/helper/spacer.dart';
import 'package:bonedetect/core/style/textstyles.dart';
import 'package:bonedetect/core/widgets/app_radio_tile.dart';
import 'package:bonedetect/ui/question_screen/data/model/question_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    super.key,
    required this.question,
    required this.selectedAnswer,
    required this.onChanged,
    this.hasError = false,
  });

  final QuestionModel question;
  final String? selectedAnswer;
  final ValueChanged<String?> onChanged;
  final bool hasError;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(question.question, style: Textstyles.font14grey600medium())
            .animate()
            .fadeIn(duration: 400.ms, delay: 150.ms)
            .moveY(begin: 10, end: 0, duration: 400.ms),
        verticalSpace(16),
        ...question.options.map(
          (option) =>
              AppRadioTile<String>(
                    value: option,
                    groupValue: selectedAnswer,
                    onChanged: onChanged,
                    title: option,
                    error: hasError,
                  )
                  .animate()
                  .fadeIn(duration: 350.ms, delay: 220.ms)
                  .moveY(begin: 8, end: 0, duration: 350.ms),
        ),
      ],
    ).animate(target: hasError ? 1 : 0).shake(duration: 350.ms, hz: 4);
  }
}
