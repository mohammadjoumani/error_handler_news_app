import 'package:error_handler/data/model/dto/response/article_response_dto.dart';
import 'package:error_handler/presentation/util/resources/asset_manger.dart';
import 'package:error_handler/presentation/util/resources/color_manager.dart';
import 'package:flutter/material.dart';

class ItemArticle extends StatelessWidget {
  const ItemArticle({super.key, required this.article});

  final ArticleResponseDto article;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: article.urlToImage != null
            ? Image.network(article.urlToImage!)
            : Image.asset(ImageAssets.imgNewPlaceHolder),
        title: Text(article.title ?? "No title"),
        subtitle: Text(article.description ?? "No description"),
      contentPadding: const EdgeInsets.all(8),
    );
  }
}
