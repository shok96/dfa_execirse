/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 25.08.2022, 22:35
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 24.08.2022, 17:21
 *
 */


import 'package:dfa_execirse/core/common/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

TextStyle? sfu800(BuildContext context, {double? size}) => Theme.of(context).textTheme.bodyText2?.copyWith(fontWeight: FontWeight.w800, fontSize: size?.sp);
TextStyle? sfu700(BuildContext context, {double? size}) => Theme.of(context).textTheme.bodyText2?.copyWith(fontWeight: FontWeight.w700, fontSize: size?.sp);
TextStyle? sfu600(BuildContext context, {double? size}) => Theme.of(context).textTheme.bodyText2?.copyWith(fontWeight: FontWeight.w600, fontSize: size?.sp);
TextStyle? sfu500(BuildContext context, {double? size}) => Theme.of(context).textTheme.bodyText2?.copyWith(fontWeight: FontWeight.w500, fontSize: size?.sp);
TextStyle? sfu400(BuildContext context, {double? size}) => Theme.of(context).textTheme.bodyText2?.copyWith(fontWeight: FontWeight.w400, fontSize: size?.sp);
TextStyle? sfuMedium400(BuildContext context, {double? size}) => Theme.of(context).textTheme.bodyText2?.copyWith(fontWeight: FontWeight.w400, fontSize: size?.sp, fontFamily: 'SF UI Display Medium');
TextStyle? sfuLight400(BuildContext context, {double? size}) => Theme.of(context).textTheme.bodyText2?.copyWith(fontWeight: FontWeight.w400, fontSize: size?.sp, fontFamily: 'SF UI Display Light');

ThemeData themeData(BuildContext context) {
    return ThemeData(fontFamily: 'SF UI Display')..textTheme.bodyText2?.copyWith(color: ConstColors.baseDarkText, fontSize: 16.sp);
}
