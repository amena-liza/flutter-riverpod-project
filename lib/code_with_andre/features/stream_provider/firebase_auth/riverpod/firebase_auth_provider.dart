// Use StreamProvider to watch a Stream of results from a realtime API and reactively rebuild the UI.
//
// For example, here is how to create a StreamProvider for the authStateChanges method of the FirebaseAuth class:

import 'package:flutter_riverpod/flutter_riverpod.dart';

final authStateChangesProvider = StreamProvider.autoDispose<User?>((ref) {
  // The StreamProvider's definition is almost same as the FutureProvider, you can see that provider reference form this file as well; /lib/code_with_andre/features/future_provider/product_app/riverpod/product_provider.dart
  // get FirebaseAuth from the provider below
  final firebaseAuth = ref.watch(firebaseAuthProvider);
  // call a method that returns a Stream<User?>
  return firebaseAuth?.authStateChanges();
});

// provider to access the FirebaseAuth instance
final firebaseAuthProvider = Provider((ref) {
  return FirebaseAuth.instance;
});

class FirebaseAuth {
  static FirebaseAuth? get instance => null;

  authStateChanges() {}
}

class User {
  User(this.name, this.age);

  final String name;
  final int age;
}
