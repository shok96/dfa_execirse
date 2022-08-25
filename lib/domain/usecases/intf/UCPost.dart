
/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 25.08.2022, 22:35
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 25.08.2022, 18:27
 *
 */


import 'package:dfa_execirse/data/datasource/network/responseModel/MTaskResult.dart';
import 'package:dfa_execirse/data/models/MPost.dart';

abstract class UCPost {

  Future<MTaskResult<List<MPost>>> getPosts();

}