class BaseResponse {
  BaseResponse({
    this.code = 0,
    this.message = "",
    this.data,
  });

  final int code;
  final String message;
  final Map<String, dynamic> data;

  factory BaseResponse.fromJson(Map<String, dynamic> json) {
    return BaseResponse(
        code: json['code'], message: json['msg'], data: json['result']);
  }
}
