import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../riverpod/first_riverpod_app_provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Random Joke Generator')),
      body: SizedBox.expand(child: Consumer(
        builder: (context, ref, child) {
          final randomJoke = ref.watch(jokeApiProvider);

          return Stack(alignment: Alignment.center, children: [
            switch (randomJoke) {
              // When the request completes successfully, we display the joke.
              AsyncValue(:final value?) => SelectableText(
                  '${value.setup}\n\n${value.punchline}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 24),
                ),
              // On error, we display a simple error message.
              AsyncValue(error: != null) => const Text('Error fetching joke'),
              // While the request is loading, we display a progress indicator.
              AsyncValue() => const CircularProgressIndicator(),
            },
            Positioned(
                bottom: 20,
                child: ElevatedButton(
                    onPressed: () {
                      ref.invalidate(jokeApiProvider);
                    },
                    child: const Text('Get Another Joke'))),
            if (randomJoke.isRefreshing)
              const Positioned(
                  top: 0, left: 0, right: 0, child: LinearProgressIndicator()),
          ]);
        },
      )),
    );
  }
}

class FirstRiverpodAppPage extends ConsumerWidget {
  const FirstRiverpodAppPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final apiAsync = ref.watch(getJokeProvider);
    return apiAsync.when(
        data: (data) => Column(
              children: [
                SelectableText(
                  '${data.setup} \n\n ${data.punchline}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 24),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                    onPressed: () => ref.invalidate(getJokeProvider),
                    child: const Text('refresh')),
                if (apiAsync.isRefreshing) const LinearProgressIndicator(),
              ],
            ),
        loading: () => const CircularProgressIndicator(),
        error: (err, stack) => Text(err.toString()));

    // apiAsync.wh
    // return apiAsync.when();
    // return const Text('Hello!');
  }
}
