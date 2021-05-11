import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'sources_state.dart';

class SourcesCubit extends Cubit<SourcesState> {
  SourcesCubit() : super(SourcesInitial());
}
