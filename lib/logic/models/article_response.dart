import 'package:flutter_news/logic/models/article.dart';

class ArticleResponse {
  String? status;
  int? totalResults;
  List<Article>? articles;
  String? error;

  ArticleResponse({this.status, this.totalResults, this.articles});

  ArticleResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    totalResults = json['totalResults'];
    if (json['articles'] != null) {
      articles = <Article>[];
      json['articles'].forEach((v) {
        articles!.add(Article.fromJson(v));
      });
    }
    error = "";
  }
  ArticleResponse.withError(String errorValue)
      : articles = [],
        error = errorValue;
}
