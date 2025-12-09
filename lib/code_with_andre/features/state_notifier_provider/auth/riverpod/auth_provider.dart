import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRepositoryProvider = StateProvider<AuthRepository>((ref) {
  return const AuthRepository();
});

class AuthRepository {
  const AuthRepository();

  Future<void> signInAnonymously() async {
    // do something async (API call, Firebase, etc.)
    await Future.delayed(const Duration(milliseconds: 200));
    return;
  }

  // IF we write the signInAnonymously() function as like below without returning Future, we will get below error
// The argument type 'void Function()' can't be assigned to the parameter type 'Future<void> Function()'.
  // void signInAnonymously() {
  //   return;
  // }

/*
  You're getting the error because of this mismatch:
  ❌ Your repository method:
  void signInAnonymously() {
    return;
  }

  This returns void, not Future<void>.
  ❌ But AsyncValue.guard() expects a function that returns a Future, exactly:
  Future<void> Function()
  So your method is not compatible.

  How to Fix It
Option 1 (Recommended): Make the repository method async
class AuthRepository {
  const AuthRepository();

  Future<void> signInAnonymously() async {
    // do something async (API call, Firebase, etc.)
    await Future.delayed(Duration(milliseconds: 200));
  }
}

Why this is required?
AsyncValue.guard() is defined like this:
static Future<AsyncValue<T>> guard<T>(Future<T> Function() callback)

Meaning: it only accepts a function that returns a Future.
Your function returned void, so Dart complained.

*/
}

final authControllerProvider =
    StateNotifierProvider<AuthController, AsyncValue<void>>((ref) {
  return AuthController(ref);
});

class AuthController extends StateNotifier<AsyncValue<void>> {
  AuthController(this.ref)
      // set the initial state (synchronously)
      : super(const AsyncData(null));
  final Ref ref;

  Future<void> signInAnonymously() async {
    // read the repository using ref
    final authRepository = ref.read(authRepositoryProvider);
    // set the loading state
    state = const AsyncLoading();
    // sign in and update the state (data or error)
    state = await AsyncValue.guard(authRepository.signInAnonymously);
  }
}
