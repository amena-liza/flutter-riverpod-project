import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_files/code_with_andre/features/future_provider/product_app/riverpod/product_provider.dart';

class ProductPage extends ConsumerWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // We watch it in the build method and use pattern matching to map the resulting AsyncValue (data, loading, error) of FutureProvider to our UI:

    // watch the FutureProvider and get an AsyncValue<Response>
    final beautyProductAsync = ref.watch(beautyProductFutureProvider);
    // Note: when we watch a FutureProvider<T> or StreamProvider<T>, the return type is an AsyncValue<T>. AsyncValue is a utility class for dealing with asynchronous data in Riverpod. For more details, read this: Flutter Riverpod Tip: Use AsyncValue rather than FutureBuilder or StreamBuilder

    // use pattern matching to map the state to the UI
    return beautyProductAsync.when(
        loading: () => const CircularProgressIndicator(),
        error: (err, stack) => Text('Error: $err'),
        data: (response) => Text('Product: ${response.data?.toString()}'));
  }
}
/*

Since we're using ref.watch(clockProvider), our widget will rebuild every time the state changes (once every second) and show the updated time.

Note: ref.watch(clockProvider) returns the provider's state. To access the underlying state notifier object, call ref.read(clockProvider.notifier) instead.
*/
