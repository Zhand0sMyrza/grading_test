part of 'character_bloc.dart';

@freezed
class CharacterEvent with _$CharacterEvent {
  const factory CharacterEvent.started() = Started;
  const factory CharacterEvent.fetchCharacters() = FetchCharacters;
  const factory CharacterEvent.searchCharacter(String name) = SearchCharacter;
}
