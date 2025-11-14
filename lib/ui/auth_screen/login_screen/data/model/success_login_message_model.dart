import 'package:bonedetect/core/api/api_keys.dart';

class SuccessLoginMessageModel {
  final String message;
  final String token;
  final String name;

  SuccessLoginMessageModel({
    required this.message,
    required this.token,
    required this.name,
  });

  factory SuccessLoginMessageModel.fromJson(Map<String, dynamic> json) {
    return SuccessLoginMessageModel(
      message: json[ApiKeys.message]?.toString() ?? '',
      token: json[ApiKeys.token]?.toString() ?? '',
      name: json[ApiKeys.name]?.toString() ?? '',
    );
  }

  @override
  String toString() {
    return message;
  }
}
