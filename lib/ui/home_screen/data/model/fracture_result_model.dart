import 'package:bonedetect/core/api/api_keys.dart';

class FractureResultModel {
  final bool isFractured;
  final double confidence;
  final String visionSummary;

  FractureResultModel({
    required this.isFractured,
    required this.confidence,
    required this.visionSummary,
  });

  factory FractureResultModel.fromJson(Map<String, dynamic> json) {
    final fractureModel = json[ApiKeys.fractureModel] ?? {};

    return FractureResultModel(
      isFractured: fractureModel[ApiKeys.isFractured] ?? false,
      confidence: (fractureModel[ApiKeys.confidence] ?? 0.0).toDouble(),
      visionSummary: json[ApiKeys.visionSummary] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ApiKeys.fractureModel: {
        ApiKeys.isFractured: isFractured,
        ApiKeys.confidence: confidence,
      },
      ApiKeys.visionSummary: visionSummary,
    };
  }
}
