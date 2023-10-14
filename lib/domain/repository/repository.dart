import 'package:dartz/dartz.dart';
import 'package:error_handler/core/network/failure.dart';
import 'package:error_handler/data/model/dto/response/article_response_dto.dart';

abstract class Repository {
  Future<Either<Failure, List<ArticleResponseDto>>> getArticles();
}
