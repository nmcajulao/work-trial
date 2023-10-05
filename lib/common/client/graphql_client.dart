import 'package:graphql/client.dart';

final HttpLink httpLink = HttpLink('https://countries.trevorblades.com');

final GraphQLClient graphQLClient = GraphQLClient(
  cache: GraphQLCache(),
  link: httpLink,
);
