// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:list_graphql/src/graphql/endpoint.dart';
import 'package:list_graphql/src/graphql/queries/get_transfers.dart';
import 'package:list_graphql/src/models/character_model.dart';
import 'package:list_graphql/src/models/starwars_model.dart';

class StarWarsProvider {
  final ValueNotifier<GraphQLClient> _client = Endpoint().getClient();

  List _list = [];
  List<Character> _listCharacters = [];

  Future<List<Character>> getInfo() async {
    QueryResult _resp = await _client.value.query(QueryOptions(
      document: gql(GetTransfers.getNames),
    ));

    _list = _resp.data!['getFilm']['characters'];
    for (var element in _list) {
      _listCharacters.add(Character.fromMap(element));
    }

    return _listCharacters;
  }

  GetPerson _character = GetPerson(
    name: '',
    birthYear: '',
    gender: '',
    height: '',
    species: [],
  );
  Future<GetPerson> characterInfo(String name) async {
    QueryResult _resp = await _client.value.query(QueryOptions(
      document: gql(GetTransfers.getCharacterQuery),
    ));

    _character.name = _resp.data!['getPerson']['name'];
    _character.birthYear = _resp.data!['getPerson']['birthYear'];
    _character.gender = _resp.data!['getPerson']['gender'];
    _character.height = '${_resp.data!['getPerson']['height']}';
    _character.species!
        .add(Species(name: _resp.data!['getPerson']['species'].first['name']));

    return _character;
  }

  List<Character> get getList {
    return _listCharacters;
  }

  get getCharacter {
    return _character;
  }
}
