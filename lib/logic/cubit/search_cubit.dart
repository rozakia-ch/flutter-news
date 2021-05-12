import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_news/logic/models/article_response.dart';
import 'package:flutter_news/logic/repository/everything_repository.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
  final EverythingRepository _repository = EverythingRepository();
  search({String value}) async {
    emit(SearchLoading());
    ArticleResponse _response = await _repository.search(value: value);
    emit(SearchLoaded(articles: _response));
  }
}
