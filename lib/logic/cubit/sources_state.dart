part of 'sources_cubit.dart';

abstract class SourcesState extends Equatable {
  const SourcesState();
}

class SourcesInitial extends SourcesState {
  @override
  List<Object> get props => [];
}

class SourcesLoading extends SourcesState {
  @override
  List<Object> get props => [];
}

class SourcesLoaded extends SourcesState {
  SourceResponse sources;
  SourcesLoaded({this.sources});
  @override
  List<Object> get props => [sources];
}
