part of 'search_cubit.dart';

abstract class SearchState extends Equatable {
  const SearchState();
}

class SearchInitial extends SearchState {
  @override
  List<Object> get props => [];
}

class SearchLoading extends SearchState {
  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class SearchLoaded extends SearchState {
  ArticleResponse? articles;
  SearchLoaded({this.articles});
  @override
  List<Object?> get props => [articles];
}
