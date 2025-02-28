import 'package:climax/core/api/api_consumer.dart';
import 'package:climax/core/api/app_interceptor.dart';
import 'package:climax/core/logger/logs.dart';
import 'package:climax/features/home/data/datasources/home_local_data_source.dart';
import 'package:climax/features/home/data/datasources/home_remote_data_source.dart';
import 'package:climax/features/home/data/repositories/home_repository.dart';
import 'package:climax/features/home/logic/home/home_cubit.dart';
import 'package:climax/features/onboarding/logic/on_barding_service.dart';
import 'package:climax/features/search/data/datasources/search_remote_data_source.dart';
import 'package:climax/features/search/data/repositories/search_repository.dart';
import 'package:climax/features/search/logic/search_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/api/dio_consumer.dart';

final serviceLocator = GetIt.instance;

Future<void> initDI() async {
  //! Bloc
  await _setUpBloc();
  //! Repo
  await _setUpRepository();
  //! DataSource
  await _setUpDatasource();
  //! Core Utils
  await _setUpCoreUtils();
  //!External
  await _setUpExternal();
}

Future<void> _setUpBloc() async {
  if (!serviceLocator.isRegistered<HomeCubit>()) {
    serviceLocator.registerLazySingleton<HomeCubit>(
      () => HomeCubit(serviceLocator()),
    );
  }
  if (!serviceLocator.isRegistered<SearchCubit>()) {
    serviceLocator.registerFactory<SearchCubit>(
      () => SearchCubit(serviceLocator()),
    );
  }
  if (!serviceLocator.isRegistered<OnBardingService>()) {
    serviceLocator.registerFactory<OnBardingService>(
      () => OnBardingService(serviceLocator()),
    );
  }
}

Future<void> _setUpRepository() async {
  if (!serviceLocator.isRegistered<HomeRepository>()) {
    serviceLocator.registerLazySingleton<HomeRepository>(
      () => HomeRepository(
        serviceLocator(),
        serviceLocator(),
      ),
    );
  }
  if (!serviceLocator.isRegistered<SearchRepository>()) {
    serviceLocator.registerLazySingleton<SearchRepository>(
      () => SearchRepository(
        serviceLocator(),
      ),
    );
  }
}

Future<void> _setUpDatasource() async {
  if (!serviceLocator.isRegistered<HomeRemoteDataSource>()) {
    serviceLocator.registerLazySingleton<HomeRemoteDataSource>(
      () => HomeRemoteDataSource(
        serviceLocator(),
      ),
    );
  }
  if (!serviceLocator.isRegistered<HomeLocalDataSource>()) {
    serviceLocator.registerLazySingleton<HomeLocalDataSource>(
      () => HomeLocalDataSource(
        serviceLocator(),
      ),
    );
  }
  if (!serviceLocator.isRegistered<SearchRemoteDataSource>()) {
    serviceLocator.registerLazySingleton<SearchRemoteDataSource>(
      () => SearchRemoteDataSource(
        serviceLocator(),
      ),
    );
  }
}

Future<void> _setUpCoreUtils() async {
  // serviceLocator.registerLazySingleton<NetworkInformation>(
  //   () => NetworkInformationImplementation(
  //     internetConnectionChecker: serviceLocator(),
  //   ),
  // );

  if (!serviceLocator.isRegistered<ApiConsumer>()) {
    serviceLocator.registerLazySingleton<ApiConsumer>(
        () => DioConsumer(dio: serviceLocator()));
  }
}

Future<void> _setUpExternal() async {
  final sharedPref = await SharedPreferences.getInstance();
  serviceLocator.registerLazySingleton(() => sharedPref);

  final dotEnv = DotEnv();
  if (!serviceLocator.isRegistered<DotEnv>()) {
    kLogger.green('Starting DotEnv');

    //* Register and ensure DotEnv is loaded before using it
    serviceLocator.registerSingletonAsync<DotEnv>(
      () async {
        await dotEnv.load();
        return dotEnv;
      },
    );

    //* Wait for all dependencies to be ready
    await serviceLocator.allReady();
  }

  if (!serviceLocator.isRegistered<AppInterceptor>()) {
    serviceLocator.registerLazySingleton(() => AppInterceptor());
  }

  if (!serviceLocator.isRegistered<LogInterceptor>()) {
    serviceLocator.registerLazySingleton(
      () => LogInterceptor(
        request: true,
        requestBody: true,
        requestHeader: true,
        error: true,
        responseBody: false,
        responseHeader: false,
      ),
    );
  }

  if (!serviceLocator.isRegistered<Dio>()) {
    serviceLocator.registerLazySingleton(() => Dio());
  }

  if (!serviceLocator.isRegistered<ApiConsumer>()) {
    serviceLocator
        .registerLazySingleton(() => DioConsumer(dio: serviceLocator()));
  }

  // serviceLocator.registerLazySingleton(() => InternetConnectionChecker());
}
