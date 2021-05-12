import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_news/logic/models/article_response.dart';
import 'package:flutter_news/logic/repository/everything_repository.dart';

part 'source_news_state.dart';

class SourceNewsCubit extends Cubit<SourceNewsState> {
  SourceNewsCubit() : super(SourceNewsInitial());
  final EverythingRepository _repository = EverythingRepository();
  getSourceNews({String sourceId}) async {
    ArticleResponse _response = await _repository.getSourceNews(sourceId: sourceId);
  }
}
