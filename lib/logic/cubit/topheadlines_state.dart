part of 'topheadlines_cubit.dart';

abstract class TopheadlinesState extends Equatable {
  const TopheadlinesState();
}

class TopheadlinesInitial extends TopheadlinesState {
  @override
  List<Object> get props => [];
}

class TopheadlinesLoading extends TopheadlinesState {
  @override
  List<Object> get props => [];
}

class TopheadlinesLoaded extends TopheadlinesState {
  ArticleResponse articles;
  TopheadlinesLoaded({this.articles});
  @override
  List<Object> get props => [];
}
