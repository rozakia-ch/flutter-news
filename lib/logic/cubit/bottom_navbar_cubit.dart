import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_news/constants/navbar_item.dart';

part 'bottom_navbar_state.dart';

class BottomNavbarCubit extends Cubit<BottomNavbarState> {
  BottomNavbarCubit() : super(BottomNavbarInitial());
  NavBarItem defaultItem = NavBarItem.HOME;
}
