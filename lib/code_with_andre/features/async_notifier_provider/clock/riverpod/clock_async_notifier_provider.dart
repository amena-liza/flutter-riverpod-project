import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class ClockNotifier extends AsyncNotifier<DateTime> {
  // 1. Initialize the current

  late final Timer _timer;

  @override
  FutureOr<DateTime> build() {
    _startTimer();

    // Dispose using ref — AsyncNotifier has no dispose()
    // The ref object automatically gets initialized on the AsyncNotifier Provider
    ref.onDispose(() {
      _timer.cancel();
    });

    return DateTime.now();
  }

  _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (callback) {
      // 3. Update the state with current time.
      state = AsyncData(DateTime.now());
    });
  }
}

// Once we have this, we can create a new provider:

final clockAsyncNotifierProvider =
    AsyncNotifierProvider<ClockNotifier, DateTime>(() => ClockNotifier());
