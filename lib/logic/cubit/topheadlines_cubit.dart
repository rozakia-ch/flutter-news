import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_news/logic/models/article_response.dart';
import 'package:flutter_news/logic/repository/topheadlines_repository.dart';

part 'topheadlines_state.dart';

class TopheadlinesCubit extends Cubit<TopheadlinesState> {
  TopheadlinesCubit() : super(TopheadlinesInitial());
  final TopheadlinesRepository _repository = TopheadlinesRepository();
  getHeadlines() async {
    emit(TopheadlinesLoading());
    ArticleResponse _response = await _repository.getTopHeadlines();
    emit(TopheadlinesLoaded(articles: _response));
  }
}
