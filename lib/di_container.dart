import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/core.dart';

GetIt getIt = GetIt.instance;
SharedPreferences preferences = getIt<SharedPreferences>();

/// Initializes the dependency injection by registering various components.
Future<void> initDependencyInjection() async {
  await _registerSingletons();
  _registerDataSources();
  _registerRepositories();
  _registerQueries();
  _registerCommands();
  _registerFactories();
}

/// Registers the repositories with GetIt.
/// Uncomment and modify the code to register your repositories.
void _registerRepositories() {
  // getIt.registerSingleton<AuthRepo>(AuthRepoImpl(authDataSource: getIt()));
}

/// Registers the data sources with GetIt.
/// Uncomment and modify the code to register your data sources.
void _registerDataSources() {
  // getIt.registerSingleton<GetMeDataSource>(
  //     GetMeDataSourceImpl(dioClient: getIt()));
}

/// Registers the commands with GetIt.
/// Uncomment and modify the code to register your commands.
void _registerCommands() {
  // getIt.registerSingleton<DeleteAppointmentCommand>(
  // DeleteAppointmentCommandImpl(appointmentRepo: getIt()));
}

/// Registers the queries with GetIt.
/// Uncomment and modify the code to register your queries.
void _registerQueries() {
  // getIt.registerSingleton<LoginQuery>(LoginQueryImpl(authRepo: getIt()));
}

/// Registers the factories with GetIt.
/// Uncomment and modify the code to register your factories.
void _registerFactories() {
  // getIt.registerFactory<AuthBloc>(
  //   () => AuthBloc(
  //     registerQuery: getIt(),
  //     loginQuery: getIt(),
  //     changePasswordQuery: getIt(),
  //   ),
  // );
}

/// Registers the singletons with GetIt.
Future<void> _registerSingletons() async {
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  
  // Configuration options for Dio.
  BaseOptions options = BaseOptions(
    baseUrl: Endpoints.baseUrl,
    followRedirects: false,
    headers: {
      'Content-Type': 'application/json',
    },
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
  );

  // Registering singletons.
  
  // Register SharedPreferences.
  getIt.registerSingleton<SharedPreferences>(sharedPreferences);
  
  // Register GraphQLConfig.
  getIt.registerSingleton<GraphQLConfig>(GraphQLConfig(httpLink: getIt()));
  
  // Register GraphService.
  getIt.registerSingleton<GraphService>(GraphService(graphQLConfig: getIt()));
  
  // Register HttpLink.
  getIt.registerSingleton<HttpLink>(HttpLink(Endpoints.baseUrl));
  
  // Register Dio with custom configurations and interceptors.
  getIt.registerSingleton<BaseDio>(
    DioClient(
      options: options,
      interceptors: [DioInterceptor()],
      dio: Dio(),
    ),
  );
}
