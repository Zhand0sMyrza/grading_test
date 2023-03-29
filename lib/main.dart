import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grade_test_task/home/domain/data_usecase.dart';
import 'package:grade_test_task/home/presentation/bloc/character_bloc.dart';
import 'package:grade_test_task/home/presentation/ui/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<DataUseCase>(
      create: (context) => DataUseCaseImpl(),
      child: BlocProvider<CharacterBloc>(
        create: (context) => CharacterBloc(context.read<DataUseCase>())
          ..add(
            const CharacterEvent.fetchCharacters(),
          ),
        child: MaterialApp(
          theme: ThemeData(
            appBarTheme: const AppBarTheme(
              color: Colors.white,
            ),
            textSelectionTheme: const TextSelectionThemeData(
              cursorColor: Colors.green,
            ),
            useMaterial3: true,
          ),
          home: const HomePage(),
        ),
      ),
    );
  }
}
