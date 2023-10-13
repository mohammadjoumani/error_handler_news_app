import 'package:dio/dio.dart';
import 'package:error_handler/core/app/constants.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio);

  Future<Response> get({required String endPoint, dynamic data, dynamic params}) async {
    var response = await _dio.get('${Constants.baseUrl}$endPoint', data: data, queryParameters: params);
    return response;
  }

  Future<Response> post(
      {required String endPoint, dynamic data, dynamic params}) async {
    var response = await _dio.post('${Constants.baseUrl}$endPoint',
        data: data, queryParameters: params);
    return response;
  }

  Future<Response> put({required String endPoint}) async {
    var response = await _dio.put('${Constants.baseUrl}$endPoint');
    return response;
  }

  Future<Response> delete({required String endPoint}) async {
    var response = await _dio.delete('${Constants.baseUrl}$endPoint');
    return response;
  }
}
