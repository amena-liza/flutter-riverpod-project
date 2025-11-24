import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../riverpod/provider.dart';
import '../widgets/counter.dart';

class HelloWorldTestOne extends ConsumerWidget {
  const HelloWorldTestOne({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final clockAsync = ref.watch(clockAsyncNotifierProvider);

    return clockAsync.when(
        data: (data) {
          return Center(
              child: Column(
            children: [
              const CounterWidget(),
              Text('Time: $data'),
            ],
          ));
        },
        loading: () => const CircularProgressIndicator(),
        error: (err, stack) => Text(err.toString()));
  }
}
