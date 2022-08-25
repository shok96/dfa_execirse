/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 25.08.2022, 22:38
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 25.08.2022, 22:38
 *
 */
import 'package:dfa_execirse/core/common/colors.dart';
import 'package:dfa_execirse/core/common/icons.dart';
import 'package:dfa_execirse/core/common/images.dart';
import 'package:dfa_execirse/core/common/utils.dart';
import 'package:dfa_execirse/core/themes/base_theme.dart';
import 'package:dfa_execirse/data/models/MPost.dart';
import 'package:dfa_execirse/presentation/pages/detail/detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HeaderSliver extends StatelessWidget{


  MPost mPost;

  HeaderSliver(this.mPost);

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: PersistentHeader(
        widget: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        LocalImages.news_full,
                      ),
                      fit: BoxFit.cover)),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                              ConstColors.white.withOpacity(.20),
                              ConstColors.black.withOpacity(.57)
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            stops: [.2, .8])),
                  ),
                  Column(
                    children: [
                      SizedBox(height: 100,),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 12.h, horizontal: 24.w),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              mPost.title,
                              style: sfu600(context, size: 18)
                                  ?.copyWith(color: ConstColors.white), overflow: TextOverflow.fade,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 100.h,
              width: double.infinity,
              color: HexColor.fromHex("#2B2A28").withOpacity(.5),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 24.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          onTap: () => Utils.routerPop(context, null),
                          child: SvgPicture.asset(LocalIcons.back)),
                      GestureDetector(
                          onTap: () => Utils.routerPop(context, null),
                          child: SvgPicture.asset(LocalIcons.home)),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
