import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/app.dart';
import 'core/core.dart';
import 'domain/domain.dart';
import 'infrastructure/infrastructure.dart';
import 'presentation/bloc/bloc.dart';

/// Global instance of GetIt for dependency injection.
GetIt getIt = GetIt.instance;

/// Pre-fetches the SharedPreferences instance from GetIt for easy access.
SharedPreferences preferences = getIt<SharedPreferences>();

/// Initializes the dependency injection by registering various components.
Future<void> initDependencyInjection() async {
  await _registerSingletons(); // Registers singleton instances.
  _registerDataSources(); // Registers data sources.
  _registerRepositories(); // Registers repositories.
  _registerContracts(); // Registers contracts.
  _registerUsecases(); // Registers use cases.
  _registerFactories(); // Registers factory instances.
}

/// Registers the repositories with GetIt.
void _registerRepositories() {
  /// Registers the implementation of PokeRepo as a singleton.
  getIt.registerSingleton<PokeRepo>(PokeRepoImpl(pokeDataSource: getIt()));
}

/// Registers the data sources with GetIt.
void _registerDataSources() {
  /// Registers the implementation of PokeDataSource as a singleton.
  getIt.registerSingleton<PokeDataSource>(
      PokeDataSourceImpl(baseDio: getIt(), graphService: getIt()));
}

/// Registers the contracts with GetIt.
void _registerContracts() {
  /// Registers the RESTful API contract implementation as a singleton.
  getIt.registerSingleton<PokeRestfulApiContract>(
      PokeRestContractImpl(pokeRepo: getIt()));

  /// Registers the GraphQL contract implementation as a singleton.
  getIt.registerSingleton<PokeGraphContract>(
      PokeGraphContractImpl(pokeRepo: getIt()));
}

/// Registers the use cases with GetIt.
void _registerUsecases() {
  /// Registers the PokeUsecase which uses both RESTful API and GraphQL contracts.
  getIt.registerSingleton<PokeUsecase>(
      PokeUsecase(pokeContract: getIt(), pokeGraphContract: getIt()));
}

/// Registers the factory instances with GetIt.
void _registerFactories() {
  /// Registers PokeBloc as a factory, creating a new instance each time it is requested.
  getIt.registerFactory<PokeBloc>(() => PokeBloc(pokeUsecase: getIt()));
}

/// Registers the singletons with GetIt.
Future<void> _registerSingletons() async {
  /// Initialize SharedPreferences and register it as a singleton.
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();

  // Configuration options for Dio.
  BaseOptions options = BaseOptions(
    baseUrl: EndPoints.baseUrl, // Base URL for API requests.
    followRedirects: false, // Disables following redirects automatically.
    headers: {
      'Content-Type': 'application/json', // Default content type for requests.
    },
    connectTimeout: const Duration(seconds: 10), // Connection timeout.
    receiveTimeout: const Duration(seconds: 10), // Response timeout.
  );

  // Registering singletons.

  // Register SharedPreferences.
  getIt.registerSingleton<SharedPreferences>(sharedPreferences);

  // Register HttpLink for GraphQL.
  getIt.registerSingleton<Link>(customGraphLink);

  // Register GraphQlConfig which holds the GraphQL configuration.
  getIt.registerSingleton<GraphQlConfig>(GraphQlConfig(link: getIt()));

  // Register GraphService which handles GraphQL operations.
  getIt.registerSingleton<GraphService>(GraphService(graphQLConfig: getIt()));

  // Register Dio instance with custom configurations and interceptors.
  getIt.registerSingleton<BaseDio>(
    DioClient(
      options: options, // Pass the custom options defined above.
      interceptors: [DioInterceptor()], // List of interceptors.
      dio: Dio(), // Dio instance.
    ),
  );
}
