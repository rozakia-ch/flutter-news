import 'package:dio/dio.dart';
import 'package:flutter_news/constants/api_constants.dart';
import 'package:flutter_news/logic/models/article_response.dart';

class EverythingRepository {
  final Dio _dio = Dio();
  Future search({String value}) async {
    var params = {"apiKey": ApiConstans.API_KEY, "q": value, "sortBy": "popularity"};
    try {
      Response response =
          await _dio.get(ApiConstans.API_URL + "/everything", queryParameters: params);
      return ArticleResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occurred: $error stackTrace: $stacktrace");
      return error;
    }
  }

  Future getHotNews() async {
    var params = {"apiKey": ApiConstans.API_KEY, "q": "indonesia", "sortBy": "popularity"};
    try {
      Response response =
          await _dio.get(ApiConstans.API_URL + "/everything", queryParameters: params);
      return ArticleResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occurred: $error stackTrace: $stacktrace");
      return error;
    }
  }

  Future getSourceNews({String sourceId}) async {
    var params = {"apiKey": ApiConstans.API_KEY, "sources": sourceId};
    try {
      Response response =
          await _dio.get(ApiConstans.API_URL + "/everything", queryParameters: params);
      return ArticleResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occurred: $error stackTrace: $stacktrace");
      return error;
    }
  }
}
