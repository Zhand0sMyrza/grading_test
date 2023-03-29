import 'package:dio/dio.dart';
import 'package:grade_test_task/core/contants/app_links.dart';
import 'package:grade_test_task/home/domain/models/character.dart';

abstract class DataRepository {
  Future<List<Character>> fetchCharacters();
}

class DataRepositoryImpl implements DataRepository {
  final _dio = Dio();

  @override
  Future<List<Character>> fetchCharacters() async {
    final result = await _dio.get(AppLinks.chatactersPath);
    final charactersList = (result.data['results'] as List)
        .map(
          (item) => Character.fromJson(item),
        )
        .toList();

    return charactersList;
  }
}
