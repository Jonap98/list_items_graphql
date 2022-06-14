// To parse this JSON data, do
//
//     final starwarsModel = starwarsModelFromMap(jsonString);

import 'dart:convert';

class StarwarsModel {
  StarwarsModel({
    required this.data,
  });

  Data data;

  factory StarwarsModel.fromJson(String str) =>
      StarwarsModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory StarwarsModel.fromMap(Map<String, dynamic> json) => StarwarsModel(
        data: Data.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "data": data.toMap(),
      };
}

class Data {
  Data({
    required this.getFilm,
  });

  GetFilm getFilm;

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        getFilm: GetFilm.fromMap(json["getFilm"]),
      );

  Map<String, dynamic> toMap() => {
        "getFilm": getFilm.toMap(),
      };
}

class GetFilm {
  GetFilm({
    required this.characters,
    required this.planets,
    required this.species,
    required this.starships,
    required this.vehicles,
  });

  List<Character> characters;
  List<Character> planets;
  List<Character> species;
  List<Character> starships;
  List<Character> vehicles;

  factory GetFilm.fromJson(String str) => GetFilm.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GetFilm.fromMap(Map<String, dynamic> json) => GetFilm(
        characters: List<Character>.from(
            json["characters"].map((x) => Character.fromMap(x))),
        planets: List<Character>.from(
            json["planets"].map((x) => Character.fromMap(x))),
        species: List<Character>.from(
            json["species"].map((x) => Character.fromMap(x))),
        starships: List<Character>.from(
            json["starships"].map((x) => Character.fromMap(x))),
        vehicles: List<Character>.from(
            json["vehicles"].map((x) => Character.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "characters": List<dynamic>.from(characters.map((x) => x.toMap())),
        "planets": List<dynamic>.from(planets.map((x) => x.toMap())),
        "species": List<dynamic>.from(species.map((x) => x.toMap())),
        "starships": List<dynamic>.from(starships.map((x) => x.toMap())),
        "vehicles": List<dynamic>.from(vehicles.map((x) => x.toMap())),
      };
}

class Character {
  Character({
    required this.name,
  });

  String name;

  factory Character.fromJson(String str) => Character.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Character.fromMap(Map<String, dynamic> json) => Character(
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
      };
}
