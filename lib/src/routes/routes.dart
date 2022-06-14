import 'package:flutter/material.dart';
import 'package:list_graphql/src/pages/character_details_screen.dart';
import 'package:list_graphql/src/pages/home_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    'home_screen': (BuildContext context) => const HomePage(),
    'character_details_screen': (BuildContext context) =>
        const CharacterDetailsScreen(),
  };
}
