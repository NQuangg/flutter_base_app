class BaseResponse {
  final int code;
  final String message;
  final dynamic data;

  BaseResponse({
    required this.code,
    required this.message,
    required this.data,
  });

  factory BaseResponse.fromJson(Map<String, dynamic> map) {
    return BaseResponse(
      code: map['code'] ?? 0,
      message: map['message'] ?? '',
      data: map['data'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code;'] = code;
    data['message'] = message;
    data['data'] = data;
    return data;
  }
}
