import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:list_graphql/src/bloc/characters_bloc/characters_bloc.dart';

class CharacterDetailsScreen extends StatelessWidget {
  const CharacterDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(title: const Text('Character')),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            child: FaIcon(
              FontAwesomeIcons.jedi,
              size: size.width * 0.5,
              color: Colors.amber,
            ),
          ),
          Center(
            child: BlocBuilder<CharactersBloc, CharactersState>(
              builder: (context, state) {
                return (!state.hasData)
                    ? const Center(child: Text('No hay datos'))
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            state.character!.name ?? 'No name',
                            style: const TextStyle(fontSize: 35),
                          ),
                          const SizedBox(height: 10),
                          Text(
                              'Gender: ${state.character!.gender ?? 'No gender'}',
                              style: const TextStyle(fontSize: 25)),
                          Text(
                              'Birthday: ${state.character!.birthYear ?? 'No birthday'}',
                              style: const TextStyle(fontSize: 25)),
                          Text(
                              'Height: ${state.character!.height ?? 'No height'}',
                              style: const TextStyle(fontSize: 25)),
                        ],
                      );
              },
            ),
          ),
        ],
      ),
    );
  }
}
