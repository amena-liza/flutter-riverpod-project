import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'code_with_andre/features/test/view/page.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text('Example')),
        body: Center(
          // child: RecipeDetailsDisplay(), // RecipeDisplay
          // child: CounterPage(), // RecipeDisplay
          // child: ClockPage(), // RecipeDisplay
          // child: ProductPage(), // RecipeDisplay
          // child: CounterNotifierPage(), // RecipeDisplay
          // child: ClockAsyncNotifierPage(), // RecipeDisplay
          child: HelloWorldTest(), // RecipeDisplay
        ),
      ),
    );
  }
}
