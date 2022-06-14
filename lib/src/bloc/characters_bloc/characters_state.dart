part of 'characters_bloc.dart';

@immutable
class CharactersState {
  final bool hasData;
  final GetPerson? character;

  const CharactersState({this.hasData = false, this.character});

  CharactersState copyWith({
    bool? hasData,
    GetPerson? character,
  }) =>
      CharactersState(
        hasData: hasData ?? this.hasData,
        character: character ?? this.character,
      );
}

class CharactersInitial extends CharactersState {
  const CharactersInitial() : super(hasData: false, character: null);
}

class CharactersSetState extends CharactersState {
  final GetPerson newCharacter;

  const CharactersSetState(this.newCharacter)
      : super(
          hasData: true,
          character: newCharacter,
        );
}
