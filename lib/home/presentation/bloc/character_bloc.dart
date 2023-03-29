import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grade_test_task/home/domain/data_usecase.dart';
import 'package:grade_test_task/home/domain/models/character.dart';

part 'character_event.dart';
part 'character_state.dart';
part 'character_bloc.freezed.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  CharacterBloc(this._useCase) : super(const _Initial()) {
    on<FetchCharacters>(_onFetchCharacters);
    on<SearchCharacter>(_onSearchCharacters);
  }

  final DataUseCase _useCase;

  Future<void> _onFetchCharacters(
    FetchCharacters event,
    Emitter<CharacterState> emit,
  ) async {
    try {
      emit(const _Loading());
      final charactersList = await _useCase.fetchCharactersList();
      emit(
        _Success(charactersList: charactersList),
      );
    } catch (e) {
      emit(
        _Failed('Нет соединения с интернетом :( \n\n$e'),
      );
    }
  }

  Future<void> _onSearchCharacters(
    SearchCharacter event,
    Emitter<CharacterState> emit,
  ) async {
    try {
      emit(const _Loading());
      final searchResult = _useCase.searchCharacter(event.name);
      emit(
        _Success(charactersList: searchResult),
      );
    } catch (_) {
      emit(
        const _Failed('Ничего не найдено'),
      );
    }
  }
}
