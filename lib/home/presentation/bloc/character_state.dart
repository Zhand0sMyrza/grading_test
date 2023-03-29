part of 'character_bloc.dart';

@Freezed(equal: true)
class CharacterState with _$CharacterState {
  const factory CharacterState.initial() = _Initial;
  const factory CharacterState.loading() = _Loading;
  const factory CharacterState.success({
    required List<Character> charactersList,
  }) = _Success;
  const factory CharacterState.failed(String errorText) = _Failed;
}
