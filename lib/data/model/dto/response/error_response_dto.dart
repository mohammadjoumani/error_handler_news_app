class ErrorResponseDto {
  String? status;
  String? code;
  String? message;

  ErrorResponseDto({this.status, this.code, this.message});

  ErrorResponseDto.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['code'] = code;
    data['message'] = message;
    return data;
  }
}