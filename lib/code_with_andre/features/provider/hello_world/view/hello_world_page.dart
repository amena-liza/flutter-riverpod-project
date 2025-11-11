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
import 'package:riverpod_files/code_with_andre/features/provider/hello_world/riverpod/hello_world_provider.dart';

class HelloWorld extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final helloWorld = ref.watch(helloWorldProvider);
    return Text(helloWorld);
  }
}

class HelloWorldWidgetOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (_, WidgetRef ref, __) {
        final helloWorld = ref.watch(helloWorldProvider);
        return Text(helloWorld);
      },
    );
  }
}

// In this case, the "ref" object is one of the Consumer's builder arguments, and we can use it to watch the value of the provider.
// This works, but it's more verbose than the previous solution.
// So when should we use a Consumer over a ConsumerWidget?
// Here is one example:

final helloWorldProvider = Provider<String>((_) => 'Hello world');

class HelloWorldWidgetTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      // 1. Add a Consumer
      body: Consumer(
        // 2. specify the builder and obtain a WidgetRef
        builder: (_, WidgetRef ref, __) {
          // 3. use ref.watch() to get the value of the provider
          final helloWorld = ref.watch(helloWorldProvider);
          return Text(helloWorld);
        },
      ),
    );
  }
}

// In this case, we're wrapping only the Text with a Consumer widget, but not the parent Scaffold:
//
// Scaffold
// ├─ AppBar
// └─ Consumer
// └─ Text
//
// As a result, only the Text will rebuild if the provider value changes (more on this below).
// This may seem like a small detail, but if you have a big widget class with a complex layout, you can use Consumer to rebuild only the widgets that depend on the provider. Though as I said in a previous article:
// Creating widgets that are small and reusable favours composition, leading to code that is concise, more performant, and easier to reason about.
// If you follow this principle and create small, reusable widgets, then you'll naturally use ConsumerWidget most of the time.

class HelloWorldPage extends StatefulWidget {
  const HelloWorldPage({super.key});
  @override
  State<HelloWorldPage> createState() => _HelloWorldPage();
}

class _HelloWorldPage extends State<HelloWorldPage> {
  String message = 'Hello World!';
  @override
  Widget build(BuildContext context) {
    return Text(
      message,
      style: const TextStyle(fontSize: 24),
    );
  }
}

// If we now want to re-write this message to an equivalent of consumer stateful widget, it will looks like:

class HelloWorldPageFour extends ConsumerStatefulWidget {
  const HelloWorldPageFour({super.key});

  @override
  ConsumerState<HelloWorldPageFour> createState() => _HelloWorldPageFourState();
}

class _HelloWorldPageFourState extends ConsumerState<HelloWorldPageFour> {
  String message = 'Hello World';
  @override
  build(BuildContext context) {
    return Text(message);
  }
}

// 1. extend [ConsumerStatefulWidget]
class HelloWorldWidgetFour extends ConsumerStatefulWidget {
  @override
  ConsumerState<HelloWorldWidgetFour> createState() => _HelloWorldWidgetState();
}

// 2. extend [ConsumerState]
class _HelloWorldWidgetState extends ConsumerState<HelloWorldWidgetFour> {
  @override
  void initState() {
    super.initState();
    // 3. if needed, we can read the provider inside initState
    final helloWorld = ref.read(helloWorldProvider);
    print(helloWorld); // "Hello world"
  }

  @override
  Widget build(BuildContext context) {
    // 4. use ref.watch() to get the value of the provider
    final helloWorld = ref.watch(helloWorldProvider);
    return Text(helloWorld);
  }
}

// By subclassing from ConsumerStatefulWidget and ConsumerState, we can call ref.watch() in the build method just like we have done before.
//
// And if we need to read the provider value in any of the other widget lifecycle methods, we can use ref.read().
//
// When we subclass from ConsumerState, we can access the ref object inside all the widget lifecycle methods. This is because ConsumerState declares WidgetRef as a property, much like the Flutter State class declares BuildContext as a property that can be accessed directly inside all the widget lifecycle methods.
//
// What is a WidgetRef?
// As we have seen, we can watch a provider's value by using a ref object of type WidgetRef. This is available as an argument when we use Consumer or ConsumerWidget, and as a property when we subclass from ConsumerState.
//
// The Riverpod documentation defines WidgetRef as an object that allows widgets to interact with providers.
//
// Note that there are some similarities between BuildContext and WidgetRef:
//
// BuildContext lets us access ancestor widgets in the widget tree (such as Theme.of(context) and MediaQuery.of(context))
// WidgetRef lets us access any provider inside our app
// In other words, WidgetRef lets us access any provider in our codebase (as long as we import the corresponding file). This is by design because all Riverpod providers are global.
//
// This is significant because keeping application state and logic inside our widgets leads to poor separation of concerns. Moving it inside our providers makes our code more testable and maintainable. 👍

// Provider is great for accessing dependencies and objects that don’t change.
// You may use this to access a repository, a logger, or some other class that doesn't contain mutable state.
// For example, here's a provider that returns a DateFormat:

class DateTextViewer extends ConsumerWidget {
  const DateTextViewer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formatter = ref.watch(dateTimeFormaterProvider);
    return Text(formatter.format(DateTime.now()));
  }
}
