import 'package:bloc/bloc.dart';
import '../../data/models/characters.dart';
import '../../data/models/location.dart';
import '../../data/repositrey/characters_repostory.dart';
import 'package:meta/meta.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharacterRepositoy characterRepositoy;
  List<Character> characters = [];
  List<Location> locations = [];

  CharactersCubit(this.characterRepositoy) : super(CharactersInitial());

  List<Character> getAllCharacters() {
    characterRepositoy.getAllCharacters().then((characters) {
      emit(CharactersLoaded(characters));
      this.characters = characters;
    });
    return characters;
  }

  List<Location> getAllLocations() {
    characterRepositoy.getAllLocations().then((locations) {
      emit(LocationsLoaded(locations));
      this.locations = locations;
    });
    return locations;
  }
}
