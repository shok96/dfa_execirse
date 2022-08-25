/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 25.08.2022, 22:35
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 25.08.2022, 22:17
 *
 */

import 'package:dfa_execirse/core/common/images.dart';
import 'package:dfa_execirse/core/themes/base_theme.dart';
import 'package:dfa_execirse/presentation/pages/base_fragment_page/base_fragment_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Company extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseFragmentPage(
      appBarTitle: "Компания",
      child: Padding(
          padding: EdgeInsets.only(left: 23.w, right: 23.w, top: 65.h),
          child: Column(children: [
            Text(
              "Функционал раздела “Компания” находится в разработке",
              style: sfu400(context, size: 18),
            ),
            SizedBox(
              height: 96.h,
            ),
            Image.asset(LocalImages.calend)
          ])),
    );
  }
}
