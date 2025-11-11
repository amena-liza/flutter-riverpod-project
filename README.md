# riverpod_files

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.



#Rule of Thumb

``
// Here the priceProvider is readOnly; It's value is fixed and can't change directly

final priceProvider = Provider<int>((ref) => 100);

// With reverpod annotation the above line can be written as below as well:

@riverpod
int price(ref) {
return 100;
}


final sateFulPriceProvider = StateProvider<int>((ref) => 100);



``



[//]: # (How this same price update would look using the new @riverpod code generation style &#40;instead of StateProvider&#41;?)


// Use Provider → fixed value, no updates.
// Use StateProvider → simple mutable value (int, String, bool, etc.).
// Use StateNotifierProvider or NotifierProvider → for more complex state logic (objects, lists, multiple operations).

# 8 different kind of providers:

Provider
            StateProvider (legacy)
            StateNotifierProvider (legacy)
FutureProvider
StreamProvider
            ChangeNotifierProvider (legacy)
NotifierProvider (new in Riverpod 2.0)
AsyncNotifierProvider (new in Riverpod 2.0)

