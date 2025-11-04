import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/recipe_provider.dart';

class RecipeDetailsDisplay extends ConsumerWidget {
  const RecipeDetailsDisplay({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recipeDetailsAsync = ref.watch(RecipeDetailsProvider(1));
    return recipeDetailsAsync.when(
        data: (recipeDetails) {
          return Column(
            children: [
              Text(recipeDetails['name']),
              // Image(image: recipeDetails['image'])
            ],
          );
        },
        error: (err, _) => Text('Error: $err'),
        loading: () => const CircularProgressIndicator());

    // Text('${}');
  }
}
