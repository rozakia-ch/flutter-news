import 'package:flutter_news/logic/models/article.dart';

class ArticleResponse {
  String status;
  int totalResults;
  List<Articles> articles;

  ArticleResponse({this.status, this.totalResults, this.articles});

  ArticleResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    totalResults = json['totalResults'];
    if (json['articles'] != null) {
      articles = <Articles>[];
      json['articles'].forEach((v) {
        articles.add(new Articles.fromJson(v));
      });
    }
  }
}
