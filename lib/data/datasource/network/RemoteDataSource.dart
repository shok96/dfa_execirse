/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 25.08.2022, 22:35
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 25.08.2022, 18:20
 *
 */



import 'package:dfa_execirse/data/datasource/network/responseModel/MTaskResult.dart';
import 'package:dfa_execirse/data/models/MPost.dart';

import 'net_controller.dart';

abstract class RemoteDataSource{

  Future<MTaskResult<List<MPost>>> getPosts();

}

class RemoteDataSourceImpl implements RemoteDataSource{

  NetController _net;

  RemoteDataSourceImpl(this._net);

  @override
  Future<MTaskResult<List<MPost>>> getPosts() async{
    return await _net.asyncResult<List<MPost>>(
            () => _net.api.getPosts());
  }

}