import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_news/logic/models/article_response.dart';
import 'package:flutter_news/logic/repository/everything_repository.dart';

part 'hot_news_state.dart';

class HotNewsCubit extends Cubit<HotNewsState> {
  HotNewsCubit() : super(HotNewsInitial());
  final EverythingRepository _repository = EverythingRepository();
  getHotNews() async {
    emit(HotNewsLoading());
    ArticleResponse _response = await _repository.getHotNews();
    emit(HotNewsLoaded(articles: _response));
  }
}
