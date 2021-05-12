import 'package:flutter_news/logic/models/source.dart';

class SourceResponse {
  String? status;
  List<Source>? sources;
  String? error;

  SourceResponse({this.status, this.sources});

  SourceResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['sources'] != null) {
      sources = <Source>[];
      json['sources'].forEach((v) {
        sources!.add(new Source.fromJson(v));
      });
    }
    error = "";
  }
  SourceResponse.withError(String errorValue)
      : sources = [],
        error = errorValue;
}
