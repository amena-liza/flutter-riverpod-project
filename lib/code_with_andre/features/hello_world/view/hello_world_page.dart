// class HelloWorld extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
/* how to read the provider value here? */
//     return const Text('Hello World!');
//   }
// }

// Once we have a provider, how do we use it inside a widget?

// By subclassing ConsumerWidget instead of StatelessWidget, our widget's build method gets an extra ref object (of type WidgetRef) that we can use to watch our provider.
//
// Using ConsumerWidget is the most common option and the one you should choose most of the time.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_files/code_with_andre/features/hello_world/riverpod/hello_world_provider.dart';

class HelloWorld extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final helloWorld = ref.watch(helloWorldProvider);
    return Text(helloWorld);
  }
}
