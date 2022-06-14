part of 'characters_bloc.dart';

@immutable
abstract class CharactersEvent {}

class GetCharacterInfo extends CharactersEvent {
  final String name;

  GetCharacterInfo(this.name);
}
