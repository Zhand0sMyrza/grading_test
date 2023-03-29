import 'package:grade_test_task/home/data/data_repository.dart';
import 'package:grade_test_task/home/domain/models/character.dart';

abstract class DataUseCase {
  Future<List<Character>> fetchCharactersList();
  List<Character> searchCharacter(String name);
}

class DataUseCaseImpl implements DataUseCase {
  final repository = DataRepositoryImpl();
  final List<Character> cachedCharactersList = [];

  @override
  Future<List<Character>> fetchCharactersList() async {
    final characters = await repository.fetchCharacters();
    cachedCharactersList.addAll(characters);

    return characters;
  }

  @override
  List<Character> searchCharacter(String name) {
    if (name.isEmpty) {
      return cachedCharactersList;
    }

    final query = name.trim().toLowerCase();
    final filteredList = cachedCharactersList.where(
      (char) {
        return char.name.toLowerCase().contains(query);
      },
    ).toList();

    if (filteredList.isEmpty) {
      throw Exception('Ничего не найдено!');
    }

    return filteredList;
  }
}
