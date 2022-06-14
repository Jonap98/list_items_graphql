import 'package:bloc/bloc.dart';
import 'package:list_graphql/src/models/character_model.dart';
import 'package:list_graphql/src/providers/starwars_provider.dart';
import 'package:meta/meta.dart';

part 'characters_event.dart';
part 'characters_state.dart';

class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  CharactersBloc() : super(const CharactersState()) {
    on<GetCharacterInfo>((event, emit) async {
      final starwarsService = StarWarsProvider();

      final character = await starwarsService.characterInfo(event.name);

      emit(CharactersSetState(character));
    });
  }
}
