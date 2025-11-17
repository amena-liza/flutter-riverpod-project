import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_files/code_with_andre/features/state_notifier_provider/clock/riverpod/clock_provider.dart';

class WeatherPage extends ConsumerWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTime = ref.watch(clockNotifierProvider);
    final timeFormatted = DateFormat.Hms().format(currentTime);

    return Center(
        child: Column(children: [
      Text('Current Time $timeFormatted'),
      ElevatedButton(onPressed: () => {}, child: Text('reset')),
    ]));
  }
}
/*

Since we're using ref.watch(clockProvider), our widget will rebuild every time the state changes (once every second) and show the updated time.

Note: ref.watch(clockProvider) returns the provider's state. To access the underlying state notifier object, call ref.read(clockProvider.notifier) instead.
*/
