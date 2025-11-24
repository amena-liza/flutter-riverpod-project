import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../riverpod/provider.dart';

class CounterWidget extends ConsumerWidget {
  const CounterWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final helloProviderText = ref.read(helloProvider);
    final counter = ref.watch(counterProvider);

    return Center(
        child: Column(
      children: [
        Text('$counter'),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  ref.read(counterProvider.notifier).incrementCounter();
                },
                child: const Text('Inc')),
            const SizedBox(width: 8),
            ElevatedButton(
                onPressed: () {
                  ref.read(counterProvider.notifier).decrementCounter();
                },
                child: const Text('Dec')),
          ],
        )
      ],
    ));
  }
}
