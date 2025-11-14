class ErrorDetail {
  final List<dynamic>? loc;
  final String? msg;
  final String? type;

  ErrorDetail({
    this.loc,
    this.msg,
    this.type,
  });

  factory ErrorDetail.fromJson(Map<String, dynamic> json) {
    return ErrorDetail(
      loc: json['loc'] is List ? List<dynamic>.from(json['loc']) : null,
      msg: json['msg']?.toString(),
      type: json['type']?.toString(),
    );
  }
}
