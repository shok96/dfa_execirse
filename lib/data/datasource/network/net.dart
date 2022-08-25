/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 25.08.2022, 22:35
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 25.08.2022, 18:19
 *
 */

import 'package:dfa_execirse/core/common/constants.dart';
import 'package:dfa_execirse/data/models/MPost.dart';
import 'package:retrofit/retrofit.dart';

import 'package:dio/dio.dart' hide Headers;

part 'net.g.dart';

@RestApi(baseUrl: URL)
abstract class Api{

  factory Api(Dio dio, {String baseUrl}) = _Api;

  //home
  @GET("posts")
  Future<List<MPost>> getPosts();

}