import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:list_graphql/src/bloc/characters_bloc/characters_bloc.dart';
import 'package:list_graphql/src/graphql/queries/get_transfers.dart';
import 'package:list_graphql/src/models/starwars_model.dart';

class ListTileCard extends StatelessWidget {
  final int index;
  final List<Character> characters;

  const ListTileCard({
    Key? key,
    required this.index,
    required this.characters,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final blocProvider = BlocProvider.of<CharactersBloc>(context);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: GestureDetector(
        onTap: () async {
          Feedback.forTap(context);
          String name = characters[index].name;

          if (name.contains(' ')) {
            name = name.replaceAll(' ', '');
          }
          if (name.contains('-')) {
            name = name.replaceAll('-', '');
          }
          name = name.toLowerCase();

          GetTransfers.setCharacterQuery(name);

          blocProvider.add(GetCharacterInfo(name));
          Navigator.pushNamed(context, 'character_details_screen');
        },
        child: ListTile(
          leading: IconButton(
            // La idea eran iconos dinámicos, pero el resto no funcionaba :(
            // icon: Icon(IconDataSolid(int.parse('0xf669'))),
            icon: const FaIcon(
              FontAwesomeIcons.jedi,
              size: 30,
            ),
            onPressed: () {},
          ),
          title: Text(characters[index].name),
        ),
      ),
      decoration: BoxDecoration(
        color: Colors.amber.withOpacity(0.5),
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 2),
            blurRadius: 2,
          )
        ],
      ),
    );
  }
}
