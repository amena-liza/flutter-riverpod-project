import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProvider = NotifierProvider<Counter, int>(Counter.new);

class Counter extends Notifier<int> {
  @override
  int build() {
    // Inside "build", we return the initial state of the counter.
    return 0;
  }

  void increment() {
    state++;
  }
}
