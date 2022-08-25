/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 25.08.2022, 22:35
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 25.08.2022, 18:33
 *
 */

import 'dart:async';
import 'package:dfa_execirse/data/models/MPost.dart';
import 'package:dfa_execirse/domain/usecases/intf/UCPost.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bloc_post.freezed.dart';

class BlocPost extends Bloc<BlocPostEvent, BlocPostState> {
  UCPost _post;

  BlocPost(this._post) : super(BlocPostState.idle()){
    on<BlocPostEvent>((event, emit) async{
      await event.when(getPost: () async{
        if(state is _FetchedPostState)
          return;
        getPost();
      }, refresh: () {
        getPost();
      });
    });
  }

  Future getPost() async{
    emit(BlocPostState.proceed());
    final res = await _post.getPosts();
    if(res.isSuccessfull){
      emit(BlocPostState.fetchedPost(res.body!));
    }
    else{
      emit(BlocPostState.error(res.error ?? "Unknown error"));
    }
  }

}

@freezed
class BlocPostEvent with _$BlocPostEvent {
  const factory BlocPostEvent.getPost()= _GetPostState;
  const factory BlocPostEvent.refresh()= _RefreshState;
}

@freezed
class BlocPostState with _$BlocPostState {
  const factory BlocPostState.idle() = _IdleState;
  const factory BlocPostState.proceed() = _ProceedSate;
  const factory BlocPostState.fetchedPost(List<MPost> home) = _FetchedPostState;
  const factory BlocPostState.error(String error) = _ErrorState;
}
