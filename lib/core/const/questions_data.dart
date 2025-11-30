import 'package:bonedetect/ui/question_screen/data/model/question_model.dart';
import 'package:easy_localization/easy_localization.dart';

class QuestionsData {
  static List<QuestionModel> questions = [
    QuestionModel(
      question: "question_1".tr(),
      options: [
        "question_1_opt1".tr(),
        "question_1_opt2".tr(),
        "question_1_opt3".tr(),
        "question_1_opt4".tr(),
      ],
    ),
    QuestionModel(
      question: "question_2".tr(),
      options: [
        "question_2_opt1".tr(),
        "question_2_opt2".tr(),
        "question_2_opt3".tr(),
        "question_2_opt4".tr(),
      ],
    ),
    QuestionModel(
      question: "question_3".tr(),
      options: [
        "question_3_opt1".tr(),
        "question_3_opt2".tr(),
        "question_3_opt3".tr(),
        "question_3_opt4".tr(),
      ],
    ),
    QuestionModel(
      question: "question_4".tr(),
      options: [
        "question_4_opt1".tr(),
        "question_4_opt2".tr(),
        "question_4_opt3".tr(),
        "question_4_opt4".tr(),
      ],
    ),
  ];
}
