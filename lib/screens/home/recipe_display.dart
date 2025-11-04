import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/recipe_provider.dart';

class RecipeDisplay extends ConsumerStatefulWidget {
  const RecipeDisplay({super.key});

  @override
  ConsumerState createState() => _RecipeDisplayState();
}

class _RecipeDisplayState extends ConsumerState<RecipeDisplay> {
  int count = 0;

  // 👍 this is a common pattern when you want to keep the fetched data around
  // instead of only using it in the when widget tree.
  List<dynamic>? _recipes; // 👈 private state variable

  @override
  Widget build(BuildContext context) {
    final String recipeAppTitle = ref.watch(recipeProvider);
    final recipesAsync = ref.watch(getRecipesProvider);

    return Column(
      children: [
        Text('Count: $count'),
        ElevatedButton(
            onPressed: () {
              setState(() {
                count++;
              });
            },
            child: const Text('Increment Count')),
        const Text('Variable Provider (riverpodGeneratorVariable): \n'
            'When to use: When you just want to expose a constant, config, or derived value.\n'
            'E-commerce example: Store your API base URL, tax rate, or currency symbol.'),
        Text(recipeAppTitle),
        const Text('Future Provider (riverpodGeneratorFutureVariable): \n'
            'When to use: When you fetch data once (e.g., get recipe list).\n'
            'E-commerce example: Fetch recipe details when user opens a screen.\n'
            'My Analogy: This is one type of readonly data as well as we willn\'t be able to mutate the data'),
        Expanded(
          child: recipesAsync.when(
              data: (recipeList) {
                // 👇 store result into state variable
                _recipes = recipeList;
                // 👇 also render UI
                return ListView.builder(
                    itemCount: recipeList.length,
                    itemBuilder: (_, i) => Row(
                          children: [
                            Text(recipeList[i]['name']),
                            ElevatedButton(
                                onPressed: () {}, child: const Text('View')),
                          ],
                        ));
              },
              error: (err, _) => Text('Error: $err'),
              loading: () => const Center(child: CircularProgressIndicator())),
        ),

        // 👇 You can reuse `_recipes` anywhere else
        if (_recipes != null) Text("Last fetched: ${_recipes!.length} recipes"),

        // const Expanded(
        //   child: RecipeList(),
        // ),
        // for (var business in allBusinessList) Text(business.name),
      ],
    );
  }
}
