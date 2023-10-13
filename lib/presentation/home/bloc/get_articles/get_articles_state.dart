part of 'get_articles_bloc.dart';

@immutable
abstract class GetArticlesState {}

class GetArticlesInitial extends GetArticlesState {}

class GetArticlesLoading extends GetArticlesState {}

class GetArticlesSuccess extends GetArticlesState {
  final List<ArticleResponseDto> articles;

  GetArticlesSuccess(this.articles);
}

class GetArticlesFailure extends GetArticlesState {
  final String message;

  GetArticlesFailure(this.message);
}
