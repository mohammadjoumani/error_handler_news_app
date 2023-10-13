class ResponseDto<T> {
  int? status;
  String? message;
  T? data;

  ResponseDto({this.status, this.message, this.data});

  ResponseDto.fromJson(Map<String, dynamic> json, Function(Map<String, dynamic>) create) {
    status = json['status'];
    message = json['message'];
    data = create(json['data']);
  }

// Map<String, dynamic> toJson() {
//   final Map<String, dynamic> data = <String, dynamic>{};
//   data['status'] = this.status;
//   data['message'] = this.message;
//   data['data'] = this.data?.toJson();
//   return data;
// }
}


// abstract class Serializable {
//   Map<String, dynamic> toJson();
// }
