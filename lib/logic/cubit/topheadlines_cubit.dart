import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'topheadlines_state.dart';

class TopheadlinesCubit extends Cubit<TopheadlinesState> {
  TopheadlinesCubit() : super(TopheadlinesInitial());
}
