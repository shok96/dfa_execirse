/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 25.08.2022, 22:35
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 24.08.2022, 17:34
 *
 */

import 'package:dfa_execirse/core/themes/base_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpoilerContainer extends StatelessWidget{

  String title;
  Widget child;
  double top_padding_child;

  SpoilerContainer({required this.child, required this.title, this.top_padding_child = 12});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: sfuMedium400(context, size: 18)),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: top_padding_child.h),
          child: child,
        )
      ],
    );
  }

}