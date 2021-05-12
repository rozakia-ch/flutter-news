part of 'hot_news_cubit.dart';

abstract class HotNewsState extends Equatable {
  const HotNewsState();
}

class HotNewsInitial extends HotNewsState {
  @override
  List<Object> get props => [];
}

class HotNewsLoading extends HotNewsState {
  @override
  List<Object> get props => [];
}

class HotNewsLoaded extends HotNewsState {
  ArticleResponse articles;
  HotNewsLoaded({this.articles});
  @override
  List<Object> get props => [articles];
}
