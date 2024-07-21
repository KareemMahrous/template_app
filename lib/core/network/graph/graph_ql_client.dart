import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQlConfig {
  /// The [link] could be HTTP Link, Auth Link
  final Link link;
  final GraphQLCache? cache;

  const GraphQlConfig({
    required this.link,
    this.cache,
  });

  GraphQLClient graphQLClient() {
    return GraphQLClient(
      cache: cache ?? GraphQLCache(),
      link: link,
    );
  }
}