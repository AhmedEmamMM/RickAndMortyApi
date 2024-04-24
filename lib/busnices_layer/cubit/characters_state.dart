part of 'characters_cubit.dart';

@immutable
sealed class CharactersState {}

final class CharactersInitial extends CharactersState {}

class CharactersLoaded extends CharactersState {
  final List<Character> characters;
  CharactersLoaded(this.characters);
}

class LocationsLoaded extends CharactersState {
  final List<Location> locations;
  LocationsLoaded(this.locations);
}
