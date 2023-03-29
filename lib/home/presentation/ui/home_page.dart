import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grade_test_task/core/components/components.dart';
import 'package:grade_test_task/home/presentation/bloc/character_bloc.dart';
import 'package:grade_test_task/home/presentation/ui/widgets/character_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.lightGreen),
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextField(
              decoration: const InputDecoration(border: InputBorder.none),
              maxLines: 1,
              onChanged: (value) => context
                  .read<CharacterBloc>()
                  .add(CharacterEvent.searchCharacter(value)),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: BlocBuilder<CharacterBloc, CharacterState>(
            builder: (context, state) => state.maybeMap(
              success: (state) => ListView.separated(
                cacheExtent: 80,
                itemCount: state.charactersList.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final character = state.charactersList[index];

                  return CharacterCard(
                    imagePath: character.image,
                    name: character.name,
                  );
                },
              ),
              failed: (state) => AppErrorWidget(state.errorText),
              orElse: () => const LoadingWidget(),
            ),
          ),
        ),
      ),
    );
  }
}
