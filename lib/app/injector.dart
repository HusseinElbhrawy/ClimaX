import 'package:climax/core/api/api_consumer.dart';
import 'package:climax/core/api/app_interceptor.dart';
import 'package:climax/core/logger/logs.dart';
import 'package:climax/features/home/data/datasources/home_remote_data_source.dart';
import 'package:climax/features/home/data/repositories/home_repository.dart';
import 'package:climax/features/home/logic/home/home_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';

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
    serviceLocator.registerFactory<HomeCubit>(
      () => HomeCubit(serviceLocator()),
    );
  }

  // if (!serviceLocator.isRegistered<LoginCubit>()) {
  //   serviceLocator
  //       .registerFactory<LoginCubit>(() => LoginCubit(serviceLocator()));
  // }

  // if (!serviceLocator.isRegistered<ForgetPasswordCubit>()) {
  //   serviceLocator.registerFactory<ForgetPasswordCubit>(
  //     () => ForgetPasswordCubit(serviceLocator()),
  //   );
  // }
}

Future<void> _setUpRepository() async {
  if (!serviceLocator.isRegistered<HomeRepository>()) {
    serviceLocator.registerLazySingleton<HomeRepository>(
      () => HomeRepository(
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
  // final sharedPref = await SharedPreferences.getInstance();
  // serviceLocator.registerLazySingleton(() => sharedPref);

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
        responseBody: true,
        responseHeader: true,
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
