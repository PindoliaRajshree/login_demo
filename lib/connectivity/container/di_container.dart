//Dependency Injection

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:login_demo/data/dio/DioClient.dart';
import 'package:login_demo/provider/UserAuthProvider.dart';
import 'package:login_demo/repository/UserAuthRepository.dart';
import 'package:login_demo/res/AppUrl.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  getIt.registerLazySingleton(() => DioClient(AppUrl.appUrl, getIt()));

  //Repos
  getIt.registerLazySingleton(() => UserAuthRepo(client: getIt()));

  //Provider
  getIt.registerFactory(() => UserAuthProvider(userAuthRepo: getIt()));

  getIt.registerLazySingleton(() => Dio());
}
