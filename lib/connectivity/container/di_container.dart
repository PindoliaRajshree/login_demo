//Dependency Injection

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:login_demo/data/dio/dio_client.dart';
import 'package:login_demo/provider/user_auth_provider.dart';
import 'package:login_demo/repository/user_auth_repository.dart';
import 'package:login_demo/res/app_url.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  getIt.registerLazySingleton(() => DioClient(AppUrl.appUrl, getIt()));

  //Repos
  getIt.registerLazySingleton(() => UserAuthRepo(client: getIt()));

  //Provider
  getIt.registerFactory(() => UserAuthProvider(userAuthRepo: getIt()));

  getIt.registerLazySingleton(() => Dio());
}
