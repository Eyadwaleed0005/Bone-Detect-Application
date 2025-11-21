import 'package:bonedetect/core/api/api_keys.dart';

class FractureResultModel {
  final double fractureProbability;

  FractureResultModel({required this.fractureProbability});

  factory FractureResultModel.fromJson(Map<String, dynamic> json) {
    return FractureResultModel(
      fractureProbability:
          (json[ApiKeys.fractureProbability] ?? 0.0).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ApiKeys.fractureProbability: fractureProbability,
    };
  }
}
