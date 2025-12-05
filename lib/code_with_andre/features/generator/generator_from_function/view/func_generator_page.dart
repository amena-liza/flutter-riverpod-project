import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../riverpod/function_generator.dart';

class FunctionGeneratorPage extends ConsumerWidget {
  const FunctionGeneratorPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movies = ref.read(generatedMovieProvider).getMovies();
    // final movies = ref.read(moviesRepositoryProvider).getMovies();
    return Text(movies.toString());
  }
}
