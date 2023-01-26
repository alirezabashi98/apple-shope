import 'package:dio/dio.dart';
import 'package:flutter_apple_shop/data/datasource/authentication_datasource.dart';
import 'package:flutter_apple_shop/data/datasource/category_datasource.dart';
import 'package:flutter_apple_shop/data/repository/authentication_repository.dart';
import 'package:flutter_apple_shop/data/repository/category_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

var locator = GetIt.instance;

Future<void> getItInit() async {
  // components
  locator.registerSingleton<Dio>(
    Dio(
      BaseOptions(
        baseUrl: 'http://startflutter.ir/api/',
      ),
    ),
  );

  locator.registerSingleton<SharedPreferences>(
    await SharedPreferences.getInstance(),
  );

  // datasource
  locator.registerFactory<IAuthenticacationDataSource>(
      () => AuthenticationRemote());
  locator
      .registerFactory<ICategoryDataSource>(() => CategoryRemoteDataSource());

  // repositories
  locator.registerFactory<IAuthRipository>(() => AuthenticationRepository());
  locator.registerFactory<ICategoryRepository>(() => CategoryRepository());
}
