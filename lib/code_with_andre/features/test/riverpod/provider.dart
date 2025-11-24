import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final helloProvider = Provider<String>((ref) {
  return 'Hello';
});

final nameProvider = Provider<String>((ref) => 'Amena!');

final counterProvider = NotifierProvider<Counter, int>(() => Counter());

class Counter extends Notifier<int> {
  @override
  int build() {
    return 0;
  }

  void incrementCounter() {
    state++;
  }

  void decrementCounter() {
    state--;
  }
}

class Clock extends AsyncNotifier<DateTime> {
  late final Timer _timer;
  @override
  FutureOr<DateTime> build() async {
    await Future.delayed(const Duration(seconds: 2)); // simulate API delay
    _startTimer();

    return DateTime.now();
  }

  _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (callback) {
      state = AsyncData(DateTime.now());
    });

    ref.onDispose(() {
      _timer.cancel();
    });
  }
}

final clockAsyncNotifierProvider =
    AsyncNotifierProvider<Clock, DateTime>(Clock.new);

class RecipeNotifier extends AsyncNotifier<List<String>> {
  @override
  Future<List<String>> build() async {
    final api = ref.read(apiProvider);
    return await api.fetchRecipes();
  }
}

final recipeNotifierProvider =
    AsyncNotifierProvider<RecipeNotifier, List<String>>(RecipeNotifier.new);

class ApiService {
  Future<List<String>> fetchRecipes() async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      'Biriyani',
      'Fried Rice',
      'Sausage',
      'Polao',
      'Fish Curry',
      'Mutton Burger'
    ];
  }
}

final apiProvider = Provider((ref) => ApiService());

final apiFutureProvider = FutureProvider.autoDispose<List<String>>((ref) {
  Future.delayed(const Duration(seconds: 1));
  return ['Biriyani', 'Fried Rice', 'Sausage'];
});
