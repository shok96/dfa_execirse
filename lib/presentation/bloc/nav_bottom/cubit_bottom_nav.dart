/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 25.08.2022, 22:35
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 25.08.2022, 17:49
 *
 */

import 'package:bloc/bloc.dart';
import 'package:dfa_execirse/presentation/pages/home/home.dart';
import 'package:meta/meta.dart';

import 'cubit_bottom_nav_state.dart';


class CubitBottomNav extends Cubit<CubitBottomNavState> {
  CubitBottomNav() : super(CubitBottomNavState.Home(Home()));

  void setBaseMenuState(CubitBottomNavState value) =>
      emit(value);
}
