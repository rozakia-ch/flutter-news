import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_news/logic/models/source_response.dart';
import 'package:flutter_news/logic/repository/source_repository.dart';

part 'sources_state.dart';

class SourcesCubit extends Cubit<SourcesState> {
  SourcesCubit() : super(SourcesInitial());
  final SourceRepository _repository = SourceRepository();
  getSources() async {
    emit(SourcesLoading());
    SourceResponse _response = await _repository.getSources();
    emit(SourcesLoaded(sources: _response));
  }
}
