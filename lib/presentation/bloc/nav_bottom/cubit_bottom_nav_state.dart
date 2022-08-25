/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 25.08.2022, 22:35
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 25.08.2022, 17:46
 *
 */

import 'package:flutter/widgets.dart';
import "package:freezed_annotation/freezed_annotation.dart";

part  'cubit_bottom_nav_state.freezed.dart';

@freezed
class CubitBottomNavState with _$CubitBottomNavState{

  const factory CubitBottomNavState.Home(Widget widget) = _Home;
  const factory CubitBottomNavState.Company(Widget widget) = _Company;
  const factory CubitBottomNavState.Global(Widget widget) = _Global;
  const factory CubitBottomNavState.Calend(Widget widget) = _calend;
  const factory CubitBottomNavState.Profile(Widget widget) = _Profile;

}
