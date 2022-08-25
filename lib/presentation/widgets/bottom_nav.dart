/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 25.08.2022, 22:35
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 25.08.2022, 22:27
 *
 */

import 'package:dfa_execirse/core/common/colors.dart';
import 'package:dfa_execirse/core/common/icons.dart';
import 'package:dfa_execirse/core/common/images.dart';
import 'package:dfa_execirse/core/common/utils.dart';
import 'package:dfa_execirse/presentation/bloc/nav_bottom/cubit_bottom_nav.dart';
import 'package:dfa_execirse/presentation/bloc/nav_bottom/cubit_bottom_nav_state.dart';
import 'package:dfa_execirse/presentation/pages/about/about.dart';
import 'package:dfa_execirse/presentation/pages/calend/calend.dart';
import 'package:dfa_execirse/presentation/pages/company/company.dart';
import 'package:dfa_execirse/presentation/pages/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';


class TabNavigationItem {
  final String icon;
  final CubitBottomNavState? menuValue;

  TabNavigationItem(
      {required this.icon,
        this.menuValue});
}

List<TabNavigationItem> items(BuildContext context) => [
  TabNavigationItem(
      menuValue: CubitBottomNavState.Home(Home()),
      icon: LocalIcons.m_home),
  TabNavigationItem(
      menuValue: CubitBottomNavState.Company(Company()),
      icon: LocalIcons.m_company),
  TabNavigationItem(
      menuValue: CubitBottomNavState.Global(Home()),
      icon: LocalIcons.m_company),
  TabNavigationItem(
      menuValue: CubitBottomNavState.Calend(Calend()),
      icon: LocalIcons.m_calend),
  TabNavigationItem(
      menuValue: CubitBottomNavState.Profile(About()),
      icon: LocalIcons.m_profile),
];

List<TabNavigationItem> item = [];


class BottomNav extends StatefulWidget{

  bool notBase;

  BottomNav({this.notBase = false});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {

  @override
  void initState() {
    item.clear();
    item.addAll(items(context));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 96.h,
     color: ConstColors.lightWhite,
      width: double.infinity,
      child: BlocBuilder<CubitBottomNav, CubitBottomNavState>(
          builder: (context, state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _Item(
                  not_base: widget.notBase,
                  tab: item[0],
                  isActive: state.runtimeType == item[0].menuValue.runtimeType,
                ),
                _Item(
                  not_base: widget.notBase,
                  tab: item[1],
                  isActive: state.runtimeType == item[1].menuValue.runtimeType,
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 12.h),
                    child: GestureDetector(
                      onTap: () => Utils.toast(context, "Функционала нема"),
                      child: Container(
                        width: 51.r,
                        height: 51.r,
                        decoration: BoxDecoration(
                            color: ConstColors.yellow,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(0, 8.h),
                                  blurRadius: 5,
                                  color: ConstColors.bottomMenuInnactive
                                      .withOpacity(.5))
                            ]),
                        child: Padding(
                          padding: EdgeInsets.all(8.0.r),
                          child: Image.asset(LocalImages.logo),
                        ),
                      ),
                    ),
                  ),
                ),
                _Item(
                  not_base: widget.notBase,
                  tab: item[3],
                  isActive: state.runtimeType == item[3].menuValue.runtimeType,
                ),
                _Item(
                  not_base: widget.notBase,
                  tab: item[4],
                  isActive: state.runtimeType == item[4].menuValue.runtimeType,
                ),
              ],
            );
          }),
    );
  }
}

class _Item extends StatelessWidget {
  TabNavigationItem tab;

  bool not_base;

  bool isActive;

  _Item({required this.tab, this.isActive = false, this.not_base = false});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          context.read<CubitBottomNav>().setBaseMenuState(tab.menuValue!);
          if(not_base){
            Utils.routerPop(context, null);
          }
        },
        child: Container(
            width: 43.r,
            height: 43.r,
            decoration: BoxDecoration(
                color: isActive ? ConstColors.white : null,
                shape: BoxShape.circle,
                boxShadow: isActive ? [
                  BoxShadow(
                    color: ConstColors.yellow,
                    blurRadius: 10,
                  ),
                  BoxShadow(
                      offset: Offset(0, 3.h),
                      blurRadius: 3,
                      color:
                      ConstColors.bottomMenuInnactive.withOpacity(.5))
                ] : []),
            child: Center(
                child: SvgPicture.asset(
                  tab.icon,
                  color: isActive ? ConstColors.black : null,
                  width: 25.w,
                  height: 25.h,
                ))),
      ),
    );
  }
}
