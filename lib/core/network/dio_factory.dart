import 'package:dio/dio.dart';
import 'package:error_handler/core/app/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const String applicationJson = "application/json";
const String contentType = "content-type";
const String accept = "accept";
const int apiTimeOut = 60000;

class DioFactory {
  Future<Dio> getDio() async {
    Dio dio = Dio();

    Map<String, String> headers = {
      contentType: applicationJson,
      accept: applicationJson,
    };

    dio.options = BaseOptions(
      baseUrl: Constants.baseUrl,
      headers: headers,
      receiveTimeout: const Duration(milliseconds: apiTimeOut),
      sendTimeout: const Duration(milliseconds: apiTimeOut),
      connectTimeout: const Duration(milliseconds: apiTimeOut),
    );

    if (!kReleaseMode) {
      dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
      ));
    }

    // if (!kReleaseMode) {
    //   dio.interceptors.add(dioLoggerInterceptor);
    // }

    return dio;
  }
}
