/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 25.08.2022, 22:35
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 25.08.2022, 22:34
 *
 */

import 'package:dfa_execirse/core/common/utils.dart';
import 'package:dfa_execirse/presentation/bloc/post/bloc_post.dart';
import 'package:dfa_execirse/presentation/pages/calend/calend.dart';
import 'package:dfa_execirse/presentation/pages/home/widgets/news.dart';
import 'package:dfa_execirse/presentation/pages/home/widgets/notif.dart';
import 'package:dfa_execirse/presentation/pages/home/widgets/person.dart';
import 'package:dfa_execirse/presentation/pages/home/widgets/spoiler_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    context.read<BlocPost>().add(BlocPostEvent.getPost());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            context.read<BlocPost>().add(BlocPostEvent.refresh());
          },
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: 17.w, right: 17.w, top: 22.h),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Person(),
                    SizedBox(height: 20.h,),
                    SpoilerContainer(
                      child: GestureDetector(
                          onTap: () => Utils.routerScreen(context, Calend()),
                          child: Notif()),
                      top_padding_child: 15,
                      title: "Уведомления",
                    ),
                    SizedBox(height: 28.h,),
                    SpoilerContainer(
                      child: News(),
                      top_padding_child: 24,
                      title: "Новости",
                    ),

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
