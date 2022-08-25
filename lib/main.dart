/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 25.08.2022, 22:35
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 25.08.2022, 22:24
 *
 */

import 'dart:async';

import 'package:dfa_execirse/core/themes/base_theme.dart';
import 'package:dfa_execirse/presentation/bloc/nav_bottom/cubit_bottom_nav.dart';
import 'package:dfa_execirse/presentation/bloc/post/bloc_post.dart';
import 'package:dfa_execirse/presentation/pages/base/base.dart';
import 'package:dfa_execirse/presentation/pages/home/home.dart';
import 'package:dfa_execirse/presentation/pages/splash/splash.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'di.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();

  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((_) => BlocOverrides.runZoned(
            () => runApp(const MyApp()),
            blocObserver: AppBlocObserver(),
          ));
}

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print(change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<CubitBottomNav>(
              create: (context) => di.sl<CubitBottomNav>()),
          BlocProvider<BlocPost>(create: (context) => di.sl<BlocPost>()),
        ],
        child: ScreenUtilInit(
            designSize: Size(375, 812),
            builder: (BuildContext context, Widget? child) => MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: themeData(context),
                title: 'DFA excirse',
                home: Splash())));
  }
}
