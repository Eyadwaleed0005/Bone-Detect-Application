import 'package:bonedetect/core/dio_helper/model/error_detail.dart';
import 'package:bonedetect/core/api/api_keys.dart';

class ErrorModel {
  final List<ErrorDetail>? details;
  final String? error;
  final String? message; // ✅ جديد

  ErrorModel({
    this.details,
    this.error,
    this.message,
  });

  factory ErrorModel.fromJson(Map<String, dynamic> json) {
    List<ErrorDetail>? detailObjects;

    final detailJson = json[ApiKeys.detail];
    if (detailJson is List) {
      detailObjects = detailJson
          .whereType<Map<String, dynamic>>()
          .map((e) => ErrorDetail.fromJson(e))
          .toList();
    } else if (detailJson is String) {
      detailObjects = [
        ErrorDetail(
          msg: detailJson.toString(),
        ),
      ];
    }

    final errorMessage = json[ApiKeys.error]?.toString();
    final msg = json[ApiKeys.message]?.toString();

    return ErrorModel(
      details: detailObjects,
      error: errorMessage,
      message: msg,
    );
  }

  List<String> get messages {
    final result = <String>[];

    if (details != null) {
      result.addAll(
        details!
            .map((e) => e.msg)
            .whereType<String>()
            .toList(),
      );
    }

    if (error != null && error!.isNotEmpty) {
      result.add(error!);
    }

    if (message != null && message!.isNotEmpty) {
      result.add(message!);
    }

    return result;
  }

  bool get hasMessages => messages.isNotEmpty;

  @override
  String toString() {
    final msgs = messages;
    if (msgs.isNotEmpty) {
      return msgs.join("\n");
    }
    return "Unknown error occurred";
  }
}
