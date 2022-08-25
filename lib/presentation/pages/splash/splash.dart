/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 25.08.2022, 22:35
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 25.08.2022, 22:24
 *
 */

import 'dart:ffi';

import 'package:dfa_execirse/core/common/colors.dart';
import 'package:dfa_execirse/core/common/icons.dart';
import 'package:dfa_execirse/core/common/images.dart';
import 'package:dfa_execirse/core/common/utils.dart';
import 'package:dfa_execirse/core/themes/base_theme.dart';
import 'package:dfa_execirse/presentation/pages/base/base.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Splash extends StatefulWidget{

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () => Utils.routerScreenDeleteStack(context, Base()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: ConstColors.yellow,
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(64.r),
            child: Image.asset(LocalImages.logo),
          ),
        ),
      ),
    );
  }
}
