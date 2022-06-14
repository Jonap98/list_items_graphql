import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:list_graphql/src/bloc/starwars_bloc/starwars_bloc.dart';
import 'package:list_graphql/src/widgets/list_tile_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final blocProvider = BlocProvider.of<StarwarsBloc>(context);
    blocProvider.add(GetCharacters());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Star wars app'),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: BlocBuilder<StarwarsBloc, StarwarsState>(
          builder: (_, state) {
            return (!state.hasData)
                ? const Center(child: Text('No hay datos'))
                : ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: state.characters!.length,
                    itemBuilder: (_, index) {
                      return ListTileCard(
                          index: index, characters: state.characters!);
                    },
                  );
          },
        ),
      ),
    );
  }
}
