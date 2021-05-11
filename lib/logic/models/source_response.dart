import 'package:flutter_news/logic/models/source.dart';

class SourceResponse {
  String status;
  List<Sources> sources;

  SourceResponse({this.status, this.sources});

  SourceResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['sources'] != null) {
      sources = new List<Sources>();
      json['sources'].forEach((v) {
        sources.add(new Sources.fromJson(v));
      });
    }
  }
}
