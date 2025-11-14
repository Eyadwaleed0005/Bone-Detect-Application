import 'package:bonedetect/core/api/api_keys.dart';

class SignUpRequestModel {
  final String name;
  final String email;
  final String password;

  SignUpRequestModel({
    required this.name,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      ApiKeys.name: name,
      ApiKeys.email: email,
      ApiKeys.password: password,
    };
  }
}
