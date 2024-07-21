import 'package:graphql_flutter/graphql_flutter.dart';

import 'graph_ql_client.dart';

class GraphService {
  final GraphQlConfig graphQLConfig;

  GraphService({required this.graphQLConfig});

  GraphQLClient get client => graphQLConfig.graphQLClient();
}
