import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../riverpod/provider.dart';

class HelloWorldTest extends ConsumerWidget {
  const HelloWorldTest({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncRecipes = ref.watch(recipeNotifierProvider);
    return asyncRecipes.when(
        data: (data) {
          return Stack(
            children: [
              RecipesList(asyncRecipes.value ?? []),
              if (asyncRecipes.isRefreshing)
                const Center(child: LinearProgressIndicator()),
            ],
          );
        },
        error: (error, stack) => Text(error.toString()),
        loading: () => const CircularProgressIndicator());
  }
}

class RecipesList extends ConsumerWidget {
  const RecipesList(this.data, {super.key});

  final List<String> data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return RefreshIndicator(
      onRefresh: () async => ref.invalidate(recipeNotifierProvider),
      child: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(data[index]),
        ),
      ),
    );
  }
}
