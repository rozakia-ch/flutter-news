import 'package:flutter_news/logic/models/source.dart';

class SourceResponse {
  String status;
  List<Source> sources;

  SourceResponse({this.status, this.sources});

  SourceResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['sources'] != null) {
      sources = <Source>[];
      json['sources'].forEach((v) {
        sources.add(new Source.fromJson(v));
      });
    }
  }
}
