import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../riverpod/firebase_auth_provider.dart';

class CounterPage extends ConsumerWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // watch the StreamProvider and get an AsyncValue<User?>
    final authStateAsync = ref.watch(authStateChangesProvider);
    // use pattern matching to map the state to the UI
    return authStateAsync.when(
      data: (user) => user != null ? const HomePage() : const SignInPage(),
      loading: () => const CircularProgressIndicator(),
      error: (err, stack) => Text('Error: $err'),
    );
  }
}

// StreamProvider has many benefits over the StreamBuilder widget, which are all listed here:

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text('Hello HomePage!');
  }
}

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text('Hello SignInPage!');
  }
}
