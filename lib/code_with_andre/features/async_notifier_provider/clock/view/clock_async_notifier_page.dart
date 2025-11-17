import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../riverpod/clock_async_notifier_provider.dart';

class ClockAsyncNotifierPage extends ConsumerWidget {
  const ClockAsyncNotifierPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final time = ref.watch(clockAsyncNotifierProvider);

    return time.when(
      data: (value) => Column(
        children: [
          Text('Current Time ${DateFormat.Hms().format(value)}'),
          Text(value.toIso8601String()),
          ElevatedButton(onPressed: () => {}, child: const Text('reset')),
        ],
      ),
      loading: () => const CircularProgressIndicator(),
      error: (e, _) => Text('Error: $e'),
    );
  }
}
/*

Since we're using ref.watch(clockProvider), our widget will rebuild every time the state changes (once every second) and show the updated time.

Note: ref.watch(clockProvider) returns the provider's state. To access the underlying state notifier object, call ref.read(clockProvider.notifier) instead.
*/
