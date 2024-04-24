import '../busnices_layer/cubit/characters_cubit.dart';
import '../constants/strings.dart';
import '../data/models/characters.dart';
import '../data/repositrey/characters_repostory.dart';
import '../data/web_services(APIs)/characters_web_services.dart';
import '../presentation/screens/characters_details.dart';
import '../presentation/screens/characters_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoute {
  late CharacterRepositoy characterRepositoy;
  late CharactersCubit charactersCubit;

  AppRoute() {
    characterRepositoy = CharacterRepositoy(CharactersWebServices());
    charactersCubit = CharactersCubit(characterRepositoy);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case charactersScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => charactersCubit,
            child: const CharactersScreen(),
          ),
        );

      case charactersDetailsScreen:
        final character = settings.arguments as Character;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => CharactersCubit(characterRepositoy),
            child: CharactersDetailsScreen(
              character: character,
            ),
          ),
        );
    }
    return null;
  }
}
