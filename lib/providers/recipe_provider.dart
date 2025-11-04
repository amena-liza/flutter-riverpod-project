import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recipe_provider.g.dart';

// Start: Riverpod Generator Variable Example
// Here the recipeProvider is readOnly; It's value is fixed and can't change directly
final recipeProvider = Provider<String>((ref) {
  return 'Let\'s create recipes!';
});

// With riverpod annotation the above line can be written as below as well:
@riverpod
String recipeProviderNew(ref) {
  return 'Let\'s create recipes!';
}
// End: Riverpod Generator Variable Example

// Start: RiverpodGeneratorFutureVariable
@riverpod
Future<List<dynamic>> getRecipes(ref) async {
  final response = await http.get(Uri.parse('https://dummyjson.com/recipes'));
  final data = jsonDecode(response.body);
  return data['recipes']; // returns a list of products
}
// End: RiverpodGeneratorFutureVariable

// Start riverpodGeneratorNotifierProvider

@riverpod
class Cart extends _$Cart {
  @override
  List<int> build() {
    return []; // start empty
  }

  void add(int productId) {
    state = [...state, productId];
  }

  void remove(int productId) {
    state = state.where((id) => id != productId).toList();
  }
}

// End riverpodGeneratorNotifierProvider

// Start: riverpodGeneratorAsyncNotifierProvider
@riverpod
class RecipeDetails extends _$RecipeDetails {
  @override
  FutureOr<Map<String, dynamic>> build(int recipeId) async {
    final response =
        await http.get(Uri.parse('https://dummyjson.com/recipes/$recipeId'));
    return jsonDecode(response.body);
  }

  void get(int productId) {
    // state = [...state, productId];
  }

  void remove(int productId) {
    // state = state.where((id) => id != productId).toList();
  }
}
// End: riverpodGeneratorAsyncNotifierProvider

final moviesProvider = Provider<List<String>>((ref) {
  return [
    'Movie 1',
    'Movie 2',
    'Movie 3',
  ];
});
