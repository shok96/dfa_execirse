/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 25.08.2022, 22:35
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 24.08.2022, 17:23
 *
 */

import 'package:dfa_execirse/core/common/images.dart';
import 'package:dfa_execirse/core/themes/base_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Person extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
   return Column(
     crossAxisAlignment: CrossAxisAlignment.center,
     children: [
       Container(
         width: 152.r,
         height: 152.r,
         decoration: BoxDecoration(
           shape: BoxShape.circle,
           image: DecorationImage(
             image: AssetImage(LocalImages.buh)
           )
         ),
       ),
       //разные способы отступа (padding, sizedbox)
       Padding(
         padding:EdgeInsets.only(top: 10.h),
         child: Text("Ваш бухгалтер", style: sfu400(context, size: 18),),
       ),
       SizedBox(height: 11.h,),
       Text("Наталья Анашкина", style: sfu600(context, size: 20),),
     ],
   );
  }

}