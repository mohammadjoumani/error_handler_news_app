import 'package:dio/dio.dart';
import 'package:error_handler/core/app/app.dart';
import 'package:error_handler/core/network/failure.dart';
import 'package:error_handler/presentation/util/resources/langauge_manager.dart';
import 'package:error_handler/presentation/util/resources/string_manager.dart';

class ErrorHandler implements Exception {
  late Failure failure;

  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      // dio error so its an error from response of the API or from dio itself
      failure = _handleError(error);
    } else {
      // default error
      failure = DataSource.defaultError.getFailure();
    }
  }

  Failure _handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return DataSource.connectTimeout.getFailure();
      case DioExceptionType.sendTimeout:
        return DataSource.sendTimeout.getFailure();
      case DioExceptionType.receiveTimeout:
        return DataSource.receiveTimeout.getFailure();
      case DioExceptionType.badResponse:
        return _handleBadResponse(error);
      case DioExceptionType.cancel:
        return DataSource.cancel.getFailure();
      case DioExceptionType.connectionError:
        return DataSource.connectionError.getFailure();
      default:
        return _handleDefaultError(error);
    }
  }

  _handleBadResponse(DioException error) {
    try {
      final code = error.response?.statusCode ?? ResponseCode.defaultError;
      String message = '';
      switch (code) {
        case ResponseCode.unauthorised:
          return DataSource.unauthorised.getFailure();
        case ResponseCode.forbidden:
          return DataSource.forbidden.getFailure();
        case ResponseCode.notFound:
          return DataSource.notFound.getFailure();
        default:
          message = _extractErrorMessage(error.response?.data);
          return Failure(code, message);
      }
    } catch (e) {
      return DataSource.defaultError.getFailure();
    }
  }

  _handleDefaultError(DioException error) {
    if (error.response?.statusCode == ResponseCode.noInternetConnection) {
      return DataSource.noInternetConnection.getFailure();
    } else {
      return DataSource.defaultError.getFailure();
    }
  }

  String _extractErrorMessage(dynamic data) {
    if (data is String) return data;
    String message = '';
    if (data is Map) {
      data.forEach((key, value) {
        if (value is List) {
          message += value.join('\n');
        } else if (value is String) {
          message += value;
        } else {
          message += value.toString();
        }
      });
    }
    return message;
  }
}

enum DataSource {
  success,
  noContent,
  badRequest,
  forbidden,
  unauthorised,
  notFound,
  internetServerError,
  connectTimeout,
  connectionError,
  cancel,
  receiveTimeout,
  sendTimeout,
  cacheError,
  noInternetConnection,
  defaultError
}

extension DataSourceExtension on DataSource {
  Failure getFailure() {
    final context = navigatorKey!.currentState!.context;
    switch (this) {
      case DataSource.success:
        return Failure(ResponseCode.success, ResponseMessage.success.tr(context));
      case DataSource.noContent:
        return Failure(ResponseCode.noContent, ResponseMessage.noContent.tr(context));
      case DataSource.badRequest:
        return Failure(ResponseCode.badRequest, ResponseMessage.badRequest.tr(context));
      case DataSource.forbidden:
        return Failure(ResponseCode.forbidden, ResponseMessage.forbidden.tr(context));
      case DataSource.unauthorised:
        return Failure(ResponseCode.unauthorised, ResponseMessage.unauthorised.tr(context));
      case DataSource.notFound:
        return Failure(ResponseCode.notFound, ResponseMessage.notFound.tr(context));
      case DataSource.internetServerError:
        return Failure(ResponseCode.internalServerError, ResponseMessage.internalServerError.tr(context));
      case DataSource.connectTimeout:
        return Failure(ResponseCode.connectTimeout, ResponseMessage.connectTimeout.tr(context));
      case DataSource.connectionError:
        return Failure(ResponseCode.connectionError, ResponseMessage.connectionError.tr(context));
      case DataSource.cancel:
        return Failure(ResponseCode.cancel, ResponseMessage.cancel.tr(context));
      case DataSource.receiveTimeout:
        return Failure(ResponseCode.receiveTimeout, ResponseMessage.receiveTimeout.tr(context));
      case DataSource.sendTimeout:
        return Failure(ResponseCode.sendTimeout, ResponseMessage.sendTimeout.tr(context));
      case DataSource.cacheError:
        return Failure(ResponseCode.cacheError, ResponseMessage.cacheError.tr(context));
      case DataSource.noInternetConnection:
        return Failure(ResponseCode.noInternetConnection, ResponseMessage.noInternetConnection.tr(context));
      case DataSource.defaultError:
        return Failure(ResponseCode.defaultError, ResponseMessage.defaultError.tr(context));
    }
  }
}

class ResponseCode {
  static const int success = 200; // success with data
  static const int noContent = 201; // success with no data (no content)
  static const int badRequest = 400; // failure, API rejected request
  static const int unauthorised = 401; // failure, user is not authorised
  static const int forbidden = 403; //  failure, API rejected request
  static const int internalServerError = 500; // failure, crash in server side
  static const int notFound = 404; // failure, not found
  static const int invalidData = 422; // failure, not found

  // local status code
  static const int connectTimeout = -1;
  static const int cancel = -2;
  static const int receiveTimeout = -3;
  static const int sendTimeout = -4;
  static const int cacheError = -5;
  static const int noInternetConnection = -6;
  static const int locationDenied = -7;
  static const int defaultError = -8;
  static const int connectionError = -9;
}

class ResponseMessage {
  static const String success = AppStrings.strSuccess; // success with data
  static const String noContent = AppStrings.strNoContent; // success with no data (no content)
  static const String badRequest = AppStrings.strBadRequestError; // failure, API rejected request
  static const String unauthorised = AppStrings.strUnauthorizedError; // failure, user is not authorised
  static const String forbidden = AppStrings.strForbiddenError; //  failure, API rejected request
  static const String internalServerError = AppStrings.strInternalServerError; // failure, crash in server side
  static const String notFound = AppStrings.strNotFoundError; // failure, crash in server side

  // local status code
  static const String connectTimeout = AppStrings.strTimeoutError;
  static const String cancel = AppStrings.strDefaultError;
  static const String receiveTimeout = AppStrings.strTimeoutError;
  static const String sendTimeout = AppStrings.strTimeoutError;
  static const String cacheError = AppStrings.strCacheError;
  static const String noInternetConnection = AppStrings.strNoInternetError;
  static const String defaultError = AppStrings.strDefaultError;
  static const String connectionError = AppStrings.strDefaultError;
}

class ApiInternalStatus {
  static const int success = 200;
  static const int failure = 400;
}
