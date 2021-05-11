import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'everything_state.dart';

class EverythingCubit extends Cubit<EverythingState> {
  EverythingCubit() : super(EverythingInitial());
}
