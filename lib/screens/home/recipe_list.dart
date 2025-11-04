import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/recipe_provider.dart';

class RecipeList extends ConsumerWidget {
  const RecipeList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recipesAsync = ref.watch(getRecipesProvider);

    return recipesAsync.when(
        data: (recipeList) => ListView.builder(
            itemCount: recipeList.length,
            itemBuilder: (_, i) => Text(recipeList[i]['name'])),
        error: (err, _) => Text('Error: $err'),
        loading: () => const Center(child: CircularProgressIndicator()));
  }
}
