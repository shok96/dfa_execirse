/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 25.08.2022, 22:35
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 24.08.2022, 17:31
 *
 */

import 'package:dfa_execirse/core/common/colors.dart';
import 'package:dfa_execirse/core/common/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Notif extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(color: ConstColors.borderYellow),
          color: ConstColors.white,
          boxShadow: [BoxShadow(
            color: ConstColors.borderYellow,
            blurRadius: 5
          )]),
      child: Row(
        children: [Image.asset(LocalImages.notif)],
      ),
    );
  }
}
