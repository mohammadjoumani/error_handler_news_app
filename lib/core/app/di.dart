import 'package:error_handler/core/network/api_service.dart';
import 'package:error_handler/core/network/dio_factory.dart';
import 'package:error_handler/core/network/netword_info.dart';
import 'package:error_handler/data/repository/repository_impl.dart';
import 'package:error_handler/domain/repository/repository.dart';
import 'package:error_handler/domain/use_case/get_articles_use_case.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_prefs.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  // SharedPreferences instance
  final sharedPreferences = await SharedPreferences.getInstance();
  instance.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  // AppPreferences instance
  // final appPreferences = AppPreferences(instance());
  instance.registerLazySingleton<AppPreferences>(() => AppPreferences(instance()));

  //NetworkInfo instance
  instance.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(InternetConnectionChecker()));
  // print("${GetIt.I.isRegistered<NetworkInfo>()} " + "NetworkInfo");

  //DioFactory instance
  instance.registerLazySingleton<DioFactory>(() => DioFactory(instance()));

  final dio = await instance<DioFactory>().getDio();

  //AppServiceClient instance
  instance.registerLazySingleton(() => ApiService(dio));

  instance.registerFactory<Repository>(() => RepositoryImpl(instance(), instance(), instance()));
  instance.registerFactory<GetArticlesUseCase>(() => GetArticlesUseCase(instance()));
}
