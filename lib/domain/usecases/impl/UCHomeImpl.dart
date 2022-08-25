/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 25.08.2022, 22:35
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 25.08.2022, 18:27
 *
 */



import 'package:dfa_execirse/data/datasource/network/responseModel/MTaskResult.dart';
import 'package:dfa_execirse/data/models/MPost.dart';
import 'package:dfa_execirse/domain/repository/repository.dart';
import 'package:dfa_execirse/domain/usecases/intf/UCPost.dart';

class UCPostImpl extends UCPost {
  Repository _repository;

  UCPostImpl(this._repository);

  @override
  Future<MTaskResult<List<MPost>>> getPosts() {
    return _repository.getPosts();
  }

}
