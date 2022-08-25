/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 25.08.2022, 22:35
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 25.08.2022, 22:17
 *
 */

import 'package:dfa_execirse/core/common/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BaseFragmentPage extends StatelessWidget {

  String? appBarTitle;
  Widget child;

  BaseFragmentPage({this.appBarTitle, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarTitle != null ? AppBar(title: Text(appBarTitle!),) : null,
      body: SafeArea(
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(LocalImages.fon, fit: BoxFit.cover,   color: Colors.white.withOpacity(0.5), colorBlendMode: BlendMode.modulate,),
              child
            ],
          )
      ),
    );
  }
}