/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 25.08.2022, 22:35
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 25.08.2022, 18:36
 *
 */


import 'package:dfa_execirse/data/datasource/network/RemoteDataSource.dart';
import 'package:dfa_execirse/data/datasource/network/net.dart';
import 'package:dfa_execirse/data/datasource/network/net_controller.dart';
import 'package:dfa_execirse/data/repository/repositoryImpl.dart';
import 'package:dfa_execirse/domain/repository/repository.dart';
import 'package:dfa_execirse/domain/usecases/impl/UCHomeImpl.dart';
import 'package:dfa_execirse/domain/usecases/intf/UCPost.dart';
import 'package:dfa_execirse/presentation/bloc/nav_bottom/cubit_bottom_nav.dart';
import 'package:dfa_execirse/presentation/bloc/post/bloc_post.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart' hide Headers;

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => CubitBottomNav());
  //
  sl.registerFactory(() => BlocPost(sl()));
  //
  // sl.registerFactory(() => BlocCart(sl()));
  //
  sl.registerLazySingleton<UCPost>(() => UCPostImpl(sl()));
  // sl.registerLazySingleton<UCDetail>(() => UCDetailImpl(sl()));
  // sl.registerLazySingleton<UCCart>(() => UCCartImpl(sl()));
  //
  sl.registerLazySingleton<Repository>(() => RepositoryImpl(sl()));
  //
  sl.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl(sl()));
  //
  // sl.registerLazySingleton<StoreCart>(() => StoreCart());
  //
  sl.registerLazySingleton(() => Api(sl()));

  sl.registerLazySingleton(() => Dio());

  sl.registerLazySingleton(() => NetController(sl()));
}
