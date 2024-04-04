import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/core/network/network.dart';
import 'package:weather_app/features/data/data%20repo/data_repo.dart';
import 'package:weather_app/features/data/datasource/remote_data_source.dart';
import 'package:weather_app/features/domain/dom%20repo/dom_repo.dart';
import 'package:weather_app/features/domain/usecase/featch_weather_usecase.dart';
import 'package:weather_app/features/presentation/state%20mang/weather%20bloc/weather_bloc.dart';

final sl = GetIt.instance;

Future<void> initS() async {
  //// features - posts

  // bloc

  sl.registerFactory(() => WeatherBloc(featchWeathersUC: sl()));

  //usecase

  sl.registerLazySingleton(() => FeatchWeathersUC(sl()));

  //repo

  sl.registerLazySingleton<DomRepo>(
      () => WeatherDataRepo(networkinfo: sl(), remoteDataSource: sl()) );

  //datasource

  sl.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(client: sl()));

  //// core

  sl.registerLazySingleton<Networkinfo>(() => NetworkinfoImpl(netCheck: sl()));

  //// external

  SharedPreferences sp = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sp);

  sl.registerLazySingleton(() => InternetConnectionChecker());

  sl.registerLazySingleton(() => http.Client());
}
