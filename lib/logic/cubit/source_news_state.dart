part of 'source_news_cubit.dart';

abstract class SourceNewsState extends Equatable {
  const SourceNewsState();
}

class SourceNewsInitial extends SourceNewsState {
  @override
  List<Object> get props => [];
}

class SourceNewsLoading extends SourceNewsState {
  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class SourceNewsLoaded extends SourceNewsState {
  ArticleResponse? articles;
  SourceNewsLoaded({this.articles});
  @override
  List<Object?> get props => [articles];
}
