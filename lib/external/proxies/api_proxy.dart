import 'package:graphql_flutter/graphql_flutter.dart';

class ApiProxy extends GraphQLClient {
  ApiProxy({
    required String apiUrl,
  }) : super(
          link: HttpLink(apiUrl),
          cache: GraphQLCache(store: InMemoryStore()),
        );
}
