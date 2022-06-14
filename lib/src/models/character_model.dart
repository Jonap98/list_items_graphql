// To parse this JSON data, do
//
//     final characterModel = characterModelFromMap(jsonString);

import 'dart:convert';

class CharacterModel {
  CharacterModel({
    required this.data,
  });

  Person data;

  factory CharacterModel.fromJson(String str) =>
      CharacterModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CharacterModel.fromMap(Map<String, dynamic> json) => CharacterModel(
        data: Person.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "data": data.toMap(),
      };
}

class Person {
  Person({
    required this.getPerson,
  });

  GetPerson getPerson;

  factory Person.fromJson(String str) => Person.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Person.fromMap(Map<String, dynamic> json) => Person(
        getPerson: GetPerson.fromMap(json["getPerson"]),
      );

  Map<String, dynamic> toMap() => {
        "getPerson": getPerson.toMap(),
      };
}

class GetPerson {
  GetPerson({
    this.name,
    this.birthYear,
    this.gender,
    this.height,
    this.species,
  });

  String? name;
  String? birthYear;
  String? gender;
  String? height;
  List<Species>? species;

  factory GetPerson.fromJson(String str) => GetPerson.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GetPerson.fromMap(Map<String, dynamic> json) => GetPerson(
        name: json["name"],
        birthYear: json["birthYear"],
        gender: json["gender"],
        height: json["height"],
        species:
            List<Species>.from(json["species"].map((x) => Species.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "birthYear": birthYear,
        "gender": gender,
        "height": height,
        "species": List<dynamic>.from(species!.map((x) => x.toMap())),
      };
}

class Species {
  Species({
    required this.name,
  });

  String name;

  factory Species.fromJson(String str) => Species.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Species.fromMap(Map<String, dynamic> json) => Species(
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
      };
}
