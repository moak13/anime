import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

GraphQLClient createGraphQLClient() {
  const url = 'https://graphql.anilist.co';
  final HttpLink httpLink = HttpLink(url);

  return GraphQLClient(
    cache: GraphQLCache(),
    link: httpLink,
  );
}

ValueNotifier<GraphQLClient> client = ValueNotifier(createGraphQLClient());
