import 'package:bonedetect/ui/question_screen/data/model/question_model.dart';

class QuestionsData {
  static const List<QuestionModel> questions = [
    QuestionModel(
      question: "What is your preferred X-ray type?",
      options: ["Chest X-ray", "Hand X-ray", "Leg X-ray", "Other"],
    ),
    QuestionModel(
      question: "Have you experienced pain recently?",
      options: ["Yes, often", "Sometimes", "Rarely", "No pain"],
    ),
    QuestionModel(
      question: "How would you describe the injury severity?",
      options: ["Mild", "Moderate", "Severe", "Not sure"],
    ),
  ];
}
