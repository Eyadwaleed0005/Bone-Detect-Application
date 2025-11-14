import 'package:bonedetect/core/api/api_keys.dart';

class SuccessRegisterMessageModel {
  final String message;
  final String token;

  SuccessRegisterMessageModel({
    required this.message,
    required this.token,
  });

  factory SuccessRegisterMessageModel.fromJson(Map<String, dynamic> json) {
    return SuccessRegisterMessageModel(
      message: json[ApiKeys.message]?.toString() ?? '',
      token: json[ApiKeys.token]?.toString() ?? '',
    );
  }

  @override
  String toString() {
    return message;
  }
}
