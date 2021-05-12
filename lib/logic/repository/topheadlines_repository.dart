import 'package:dio/dio.dart';
import 'package:flutter_news/constants/api_constants.dart';
import 'package:flutter_news/logic/models/article_response.dart';

class TopheadlinesRepository {
  final Dio _dio = Dio();
  Future getTopHeadlines() async {
    var params = {"apiKey": ApiConstans.API_KEY, "country": "id"};
    try {
      Response response =
          await _dio.get(ApiConstans.API_URL + "/top-headlines", queryParameters: params);
      return ArticleResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occurred: $error stackTrace: $stacktrace");
      return error;
    }
  }
}
