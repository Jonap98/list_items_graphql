class GetTransfers {
  static String getNames = """
    query{
      getFilm(film: 4) {
        characters {
          name
        }
        planets {
          name
        }
        species {
          name
        }
        starships {
          name
        }
        vehicles {
          name
        }
      }
    }
  """;

  static String _characterQuery = '';
  static String setCharacterQuery(String name) {
    String query = """
      query {
    getPerson(person: $name) {
        name
        birthYear
        gender
        height
        species {
            name
        }
    }
}
    """;

    _characterQuery = query;

    return query;
  }

  static get getCharacterQuery {
    return _characterQuery;
  }
}
