import 'package:bonedetect/ui/question_screen/data/model/question_model.dart';

class QuestionsData {
  static const List<QuestionModel> questions = [
    QuestionModel(
      question: "What type of X-ray are you uploading?",
      options: ["Chest", "Hand", "Leg", "Other"],
    ),
    QuestionModel(
      question: "Have you experienced pain in the injured area?",
      options: ["Severe pain", "Moderate pain", "Mild pain", "No pain"],
    ),
    QuestionModel(
      question: "Is there any visible swelling?",
      options: ["Yes, large swelling", "Slight swelling", "No swelling", "Not sure"],
    ),
    QuestionModel(
      question: "Can you move the injured part normally?",
      options: ["Yes, fully", "Partially", "Barely", "Not at all"],
    ),
  ];
}
