part of 'starwars_bloc.dart';

@immutable
abstract class StarwarsState {
  final bool hasData;
  final List<Character>? characters;

  const StarwarsState({
    this.hasData = false,
    this.characters,
  });
}

class StarwarsInitial extends StarwarsState {
  const StarwarsInitial() : super(hasData: false, characters: null);
}

class StarwarsSetState extends StarwarsState {
  final List<Character> newCharacters;

  const StarwarsSetState(this.newCharacters)
      : super(
          hasData: true,
          characters: newCharacters,
        );
}
