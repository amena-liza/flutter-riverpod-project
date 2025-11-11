import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_files/code_with_andre/features/state_provider/counter/riverpod/counter_provider.dart';

class CounterPage extends ConsumerWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider);

    return ElevatedButton(
        onPressed: () => {ref.read(counterProvider.notifier).state++},
        child: Text('Value: $counter'));
  }
}
