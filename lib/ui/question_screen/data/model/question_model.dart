import 'package:flutter/foundation.dart';

@immutable
class QuestionModel {
  final String question;
  final List<String> options;

  const QuestionModel({
    required this.question,
    required this.options,
  });
}
