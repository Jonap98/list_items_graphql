import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class Endpoint {
  static HttpLink httpLink = HttpLink('https://swapi.skyra.pw/');

  static Link link = httpLink;

  ValueNotifier<GraphQLClient> getClient() {
    ValueNotifier<GraphQLClient> _client = ValueNotifier<GraphQLClient>(
      GraphQLClient(
        cache: GraphQLCache(store: HiveStore()),
        link: link,
      ),
    );

    return _client;
  }
}
