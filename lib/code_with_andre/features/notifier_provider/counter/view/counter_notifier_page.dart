import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_files/code_with_andre/features/notifier_provider/counter/riverpod/counter_notifier_provider.dart';

class CounterNotifierPage extends ConsumerWidget {
  const CounterNotifierPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider);

    return ElevatedButton(
        onPressed: () => {ref.read(counterProvider.notifier).increment()},
        child: Text('Value: $counter'));
  }
}
/*

Since we're using ref.watch(clockProvider), our widget will rebuild every time the state changes (once every second) and show the updated time.

Note: ref.watch(clockProvider) returns the provider's state. To access the underlying state notifier object, call ref.read(clockProvider.notifier) instead.
*/
