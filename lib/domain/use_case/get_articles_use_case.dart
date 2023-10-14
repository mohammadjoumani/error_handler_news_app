import 'package:dartz/dartz.dart';
import 'package:error_handler/core/generic/usecase/base_usercase.dart';
import 'package:error_handler/core/network/failure.dart';
import 'package:error_handler/data/model/dto/response/article_response_dto.dart';
import 'package:error_handler/domain/repository/repository.dart';

class GetArticlesUseCase extends BaseUseCase<Unit, List<ArticleResponseDto>> {
  final Repository _repository;

  GetArticlesUseCase(this._repository);

  @override
  Future<Either<Failure, List<ArticleResponseDto>>> execute(input) async {
    return await _repository.getArticles();
  }
}
