/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 25.08.2022, 22:35
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 25.08.2022, 18:52
 *
 */

import 'package:dfa_execirse/core/common/colors.dart';
import 'package:dfa_execirse/core/common/icons.dart';
import 'package:dfa_execirse/core/common/images.dart';
import 'package:dfa_execirse/core/common/utils.dart';
import 'package:dfa_execirse/core/themes/base_theme.dart';
import 'package:dfa_execirse/data/models/MPost.dart';
import 'package:dfa_execirse/presentation/widgets/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dfa_execirse/di.dart' as di;
import 'package:flutter_svg/flutter_svg.dart';

class Detail extends StatelessWidget {

  MPost mPost;

  Detail(this.mPost);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
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
                            SvgPicture.asset(LocalIcons.back),
                            SvgPicture.asset(LocalIcons.home),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("25 мая 2021 14:15", style: sfuLight400(context, size: 14),),
                  SizedBox(height: 15.h,),
                  Text(
                      mPost.body, style: sfuLight400(context, size: 14),)
                ],
              ),
            ),
          ]))
          // SliverList(
          //   delegate: new SliverChildListDelegate(_buildList(20)),
          // ),//
        ],
      ),
        bottomNavigationBar: BottomNav(notBase: true,)
    );
  }

}

class PersistentHeader extends SliverPersistentHeaderDelegate {
  final Widget widget;

  PersistentHeader({required this.widget});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      width: double.infinity,
      child: Card(
        margin: EdgeInsets.all(0),
        color: Colors.white,
        elevation: 5.0,
        child: Center(child: widget),
      ),
    );
  }

  @override
  double get maxExtent => 303.h;

  @override
  double get minExtent => 150.h;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
