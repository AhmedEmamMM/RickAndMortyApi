import '../models/characters.dart';
import '../models/location.dart';
import '../web_services(APIs)/characters_web_services.dart';

class CharacterRepositoy {
  final CharactersWebServices charactersWebServices;

  CharacterRepositoy(this.charactersWebServices);

  Future<List<Character>> getAllCharacters() async {
    final characters = await charactersWebServices.getAllCharacters();
    return characters
        .map((character) => Character.fromJson(character))
        .toList();
  }

  Future<List<Location>> getAllLocations() async {
    final locations = await charactersWebServices.getAllLocations();
    return locations.map((location) => Location.fromJson(location)).toList();
  }
}
