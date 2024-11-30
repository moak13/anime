import 'package:anime/services/graphql_service.dart';
import 'package:anime/utils/graphql_client.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.registerLazySingleton<GraphQlService>(
    () => GraphQlService(
      graphQLClient: createGraphQLClient(),
    ),
  );
}
