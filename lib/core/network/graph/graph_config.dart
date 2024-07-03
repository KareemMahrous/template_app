import 'package:graphql_flutter/graphql_flutter.dart';

import '../../../di_container.dart';
import '../../core.dart';

/// Configuration class for setting up GraphQL with authentication and HTTP links.
class GraphQLConfig {
  /// Constructor for GraphQLConfig which initializes the HTTP link.
  GraphQLConfig({required HttpLink httpLink}) : _httpLink = httpLink;

  /// AuthLink for adding authentication headers to each request.
  final AuthLink _authLink = AuthLink(getToken: () async {
    // Retrieve the access token from shared preferences and format it as a Bearer token.
    String? token = preferences.getString(SharedKeys.accessToken);
    token = "Bearer $token";
    return token;
  });

  /// HTTP link for making GraphQL requests.
  final HttpLink _httpLink;

  /// Creates and returns a [GraphQLClient] with the configured AuthLink and HttpLink.
  GraphQLClient graphQLClient() {
    return GraphQLClient(
      link: _authLink.concat(_httpLink),
      cache: GraphQLCache(),
    );
  }
}

/// Service class for executing GraphQL queries and mutations.
class GraphService {
  /// GraphQL configuration for creating clients.
  final GraphQLConfig graphQLConfig;

  /// Constructor for GraphService which takes a [GraphQLConfig] as a parameter.
  GraphService({required this.graphQLConfig});

  /// Getter to access the [GraphQLClient] from the [GraphQLConfig].
  GraphQLClient get client => graphQLConfig.graphQLClient();

  /// Executes a GraphQL query with the given [QueryOptions].
  ///
  /// Returns a [Future<QueryResult>] containing the results of the query.
  Future<QueryResult> query(QueryOptions options) {
    return graphQLConfig.graphQLClient().query(options);
  }
}