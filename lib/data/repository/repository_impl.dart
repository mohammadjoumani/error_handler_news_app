import 'package:dartz/dartz.dart';
import 'package:error_handler/core/app/app_prefs.dart';
import 'package:error_handler/core/app/constants.dart';
import 'package:error_handler/core/network/api_service.dart';
import 'package:error_handler/core/network/error_handler.dart';
import 'package:error_handler/core/network/failure.dart';
import 'package:error_handler/core/network/netword_info.dart';
import 'package:error_handler/data/model/dto/request/article_response_dto.dart';
import 'package:error_handler/data/model/dto/request/base_response_dto.dart';
import 'package:error_handler/domain/repository/repository.dart';

class RepositoryImpl extends Repository {
  final NetworkInfo _networkInfo;
  final ApiService _apiService;
  final AppPreferences _appPref;

  RepositoryImpl(this._networkInfo, this._apiService, this._appPref);

  @override
  Future<Either<Failure, List<ArticleResponseDto>>> getArticles() async {
    if (await _networkInfo.isConnected) {
      print(_appPref.getLocal().countryCode);
      try {
        final params = {
          "apiKey": Constants.key,
          "country": _appPref.getLocal().countryCode,
        };
        final response = await _apiService.get(endPoint: "top-headlines", params: params);
        final data = BaseResponseDto.fromJson(response.data);
        if (data.status == ApiInternalStatus.SUCCESS) {
          // success
          // return either right
          // return data
          return Right(data.articles!);
        } else {
          // failure --return business error
          // return either left
          return Left(Failure(
              400, response.data["message"] ?? ResponseMessage.DEFAULT));
        }
      } catch (error) {
        return Left(ErrorHandler
            .handle(error)
            .failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}
