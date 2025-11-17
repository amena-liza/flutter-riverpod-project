import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

/*

3. StateNotifierProvider
Use this to listen to and expose a StateNotifier.

StateNotifierProvider and StateNotifier are ideal for managing state that may change in reaction to an event or user interaction.

For example, here's a simple Clock class:

*/

class Clock extends StateNotifier<DateTime> {
  // 1. Initialize the current time
  Clock() : super(DateTime.now()) {
    // 2. Create a timer that fires every second
    _timer = Timer.periodic(const Duration(seconds: 1), (callback) {
      // 3. Update the state with current time.
      state = DateTime.now();
    });
  }

  late final Timer _timer;

  // 4. cancel the timer when finished
  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}

// This class sets the initial state by calling super(DateTime.now()) in the constructor, and updates it every second using a periodic timer.
//
// Once we have this, we can create a new provider:

final clockNotifierProvider = StateNotifierProvider<Clock, DateTime>((ref) {
  return Clock();
});

/*StateProvider is NOT designed for:

timers
async operations
streams
auto-updating values

When to use StateNotifierProvider
Use StateNotifierProvider when:

state needs logic
timers
async calls
transformations
loading/error/data
Your case = timer that updates state every second → use StateNotifier.

Key Difference (Simple)
Provider Type	        When to Use	                                    Example
StateProvider	        small & simple mutable state	                  increment counter
StateNotifierProvider	business logic, timers, async, complex state	  periodic updates, API calls



For a complete example of how and when to use StateNotifierProvider, read this article:

How to handle loading and error states with StateNotifier & AsyncValue in Flutter
More info here:
StateNotifierProvider | Riverpod.dev

As of Riverpod 2.0, StateNotifier is considered legacy and can be replaced by the new AsyncNotifier class. For more details, read: How to use Notifier and AsyncNotifier with the new Flutter Riverpod Generator.

Note that using StateNotifierProvider is overkill if you only need to read some async data. That's what FutureProvider is for. 👇





*/
