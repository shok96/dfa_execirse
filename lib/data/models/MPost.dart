/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 25.08.2022, 22:35
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 25.08.2022, 18:47
 *
 */

import "package:freezed_annotation/freezed_annotation.dart";

part 'MPost.freezed.dart';

part 'MPost.g.dart';

@freezed
class MPost with _$MPost {

  const MPost._();

  const factory MPost({
    required int id,
    required int userId,
    required String title,
    required String body,
  }) = _MPost;


  factory MPost.fromJson(Map<String, dynamic> json) => _$MPostFromJson(json);

}
