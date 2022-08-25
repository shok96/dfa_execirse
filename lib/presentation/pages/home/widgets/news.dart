/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 25.08.2022, 22:35
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 25.08.2022, 22:08
 *
 */

import 'package:dfa_execirse/core/common/colors.dart';
import 'package:dfa_execirse/core/common/images.dart';
import 'package:dfa_execirse/core/common/utils.dart';
import 'package:dfa_execirse/core/themes/base_theme.dart';
import 'package:dfa_execirse/data/models/MPost.dart';
import 'package:dfa_execirse/presentation/bloc/post/bloc_post.dart';
import 'package:dfa_execirse/presentation/pages/detail/detail.dart';
import 'package:dfa_execirse/presentation/widgets/error_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class News extends StatelessWidget{
  PageController controller = PageController(viewportFraction: 1);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 166.h,
        child: BlocConsumer<BlocPost, BlocPostState>(
          listener: (contex, state) {
            state.maybeWhen(
                orElse: () {},
                fetchedPost: (data) => Future.delayed(
                    Duration(seconds: 1),
                    () => controller.animateTo(40,
                        duration: Duration(seconds: 3),
                        curve: Curves.easeIn)));
          },
          builder: (context, state) {
            return state.when(
                idle: () => SizedBox.shrink(),
                proceed: () => Center(
                      child: CircularProgressIndicator(),
                    ),
                fetchedPost: (data) => PageView.builder(
                      itemBuilder: (context, index) => Padding(
                        padding: EdgeInsets.only(right: 4.w),
                        child: _Item(data[index]),
                      ),
                      itemCount: data.length,
                      controller: controller,
                    ),
                error: (e) => ErrorCard(
                    action: () =>
                        context.read<BlocPost>().add(BlocPostEvent.getPost())));
          },
        ));
  }
}

class _Item extends StatelessWidget {
  MPost mPost;

  _Item(this.mPost);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Utils.routerScreen(context, Detail(mPost));
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.r),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill, image: AssetImage(LocalImages.news)),
          ),
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
                        stops: [.2, .7])),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 11.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      mPost.title,
                      style: sfu600(context, size: 14)
                          ?.copyWith(color: ConstColors.white),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Flexible(
                          child: Text(
                            mPost.body,
                            style: sfuMedium400(context, size: 14)?.copyWith(
                                color: ConstColors.white,
                                overflow: TextOverflow.clip),
                            maxLines: 2,
                          ),
                        ),
                        Text(" ...ещё ",
                            style: sfu600(context, size: 14)?.copyWith(
                                color: ConstColors.white.withOpacity(.58))),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
