// import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

// late final Timer _timer;

final counterProvider = StateProvider<int>((ref) {
  return 0;
});

// The below code will cause error bcz StateProvider

// StateProvider must return the initial value (T) immediately.
// A Timer callback is void, but you tried to return DateTime.now().
// You are trying to use StateProvider for something that changes over time automatically — which is not what StateProvider is designed for.

/*final counterProvider = StateProvider<DateTime>((ref) {
  _timer = Timer.periodic(const Duration(seconds: 1), (callback) {
    // 3. Update the state with current time.
    return DateTime.now();
  });
});*/

// Use StateProvider for:
//
// very simple values
// lightweight state
// something you update manually: final countProvider = StateProvider<int>((ref) => 0);
