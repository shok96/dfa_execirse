/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 25.08.2022, 22:35
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 24.08.2022, 18:42
 *
 */

import 'package:flutter/widgets.dart';

class OverflowProofText extends StatelessWidget {
  const OverflowProofText({required this.text, required this.fallback});

  final Text text;
  final Text fallback;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: LayoutBuilder(builder: (BuildContext context, BoxConstraints size) {
          final TextPainter painter = TextPainter(
            maxLines: 1,
            textAlign: TextAlign.left,
            textDirection: TextDirection.ltr,
            text: TextSpan(
                style: text.style ?? DefaultTextStyle.of(context).style,
                text: text.data
            ),
          );

          painter.layout(maxWidth: size.maxWidth);

          return painter.didExceedMaxLines ? fallback : text;
        })
    );
  }
}