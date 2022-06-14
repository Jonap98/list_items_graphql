import 'package:bloc/bloc.dart';
import 'package:list_graphql/src/models/starwars_model.dart';
import 'package:list_graphql/src/providers/starwars_provider.dart';
import 'package:meta/meta.dart';

part 'starwars_event.dart';
part 'starwars_state.dart';

class StarwarsBloc extends Bloc<StarwarsEvent, StarwarsState> {
  StarwarsBloc() : super(const StarwarsInitial()) {
    on<GetCharacters>((event, emit) async {
      final starwarsService = StarWarsProvider();

      final list = await starwarsService.getInfo();

      emit(StarwarsSetState(list));
    });
  }
}
