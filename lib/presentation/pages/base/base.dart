/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 25.08.2022, 22:35
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 25.08.2022, 17:49
 *
 */

import 'package:dfa_execirse/core/common/colors.dart';
import 'package:dfa_execirse/core/common/icons.dart';
import 'package:dfa_execirse/core/common/images.dart';
import 'package:dfa_execirse/core/common/utils.dart';
import 'package:dfa_execirse/core/themes/base_theme.dart';
import 'package:dfa_execirse/presentation/bloc/nav_bottom/cubit_bottom_nav.dart';
import 'package:dfa_execirse/presentation/bloc/nav_bottom/cubit_bottom_nav_state.dart';
import 'package:dfa_execirse/presentation/pages/calend/calend.dart';
import 'package:dfa_execirse/presentation/pages/home/home.dart';
import 'package:dfa_execirse/presentation/widgets/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dfa_execirse/di.dart' as di;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';


class Base extends StatelessWidget {
  const Base({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _BaseScreen();
  }
}

class _BaseScreen extends StatefulWidget {
  _BaseScreen({Key? key}) : super(key: key);

  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<_BaseScreen> {
  final PageController controller = PageController();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      top: false,
      child: Scaffold(
          body: BlocBuilder<CubitBottomNav, CubitBottomNavState>(
            builder: (context, state) {
              return state.when(
                Home: (page) => page,
                Company: (page) => page,
                Global: (page) => page,
                Calend: (page) => page,
                Profile: (page) => page,
              );
            },
          ),
          bottomNavigationBar: BottomNav()),
    );
  }
}

