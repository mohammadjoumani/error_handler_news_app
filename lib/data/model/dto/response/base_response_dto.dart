import 'package:error_handler/data/model/dto/response/article_response_dto.dart';

class BaseResponseDto {
  String? status;
  int? totalResults;
  List<ArticleResponseDto>? articles;

  BaseResponseDto({this.status, this.totalResults, this.articles});

  BaseResponseDto.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    totalResults = json['totalResults'];
    if (json['articles'] != null) {
      articles = <ArticleResponseDto>[];
      json['articles'].forEach((v) {
        articles!.add(ArticleResponseDto.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['totalResults'] = totalResults;
    if (articles != null) {
      data['articles'] = articles!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


