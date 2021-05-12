import 'package:dio/dio.dart';
import 'package:flutter_news/constants/api_constants.dart';
import 'package:flutter_news/logic/models/source_response.dart';

class SourceRepository {
  final Dio _dio = Dio();
  Future getSources() async {
    var params = {"apiKey": ApiConstans.API_KEY, "language": "en", "country": "us"};
    try {
      Response response = await _dio.get(ApiConstans.API_URL + "/sources", queryParameters: params);
      return SourceResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occurred: $error stackTrace: $stacktrace");
      return SourceResponse.withError("$error");
    }
  }
}
