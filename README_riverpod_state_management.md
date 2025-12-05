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
//
//More generator examples are avaialble on this Provider file: /Users/bs01363/Documents/Flutter/MyApps/flutter-riverpod-project/lib/providers/recipe_provider.dart
//Widget: /Users/bs01363/Documents/Flutter/MyApps/flutter-riverpod-project/lib/screens/home/recipe_list.dart
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

✅ Why Provider requires (ref) but NotifierProvider(() => Counter()) does not?

Because different provider types expect different function signatures.

🟦 1. Provider
final nameProvider = Provider<String>((ref) => 'Amena!');

✔ Why must you include (ref)?

Because the constructor of Provider is defined like this:

Provider<T>(T Function(ProviderRef ref) create)


So it always expects a function that receives a ref as its parameter.

ref is mandatory because:

It lets you read other providers (ref.watch(...))

It manages lifecycle (dispose, onCancel, etc.)

Even if you don’t use it, Riverpod still requires the function signature.

That’s why this ❌ will NOT work:

final nameProvider = Provider<String>(() => 'Amena!'); // ❌ wrong

🟩 2. NotifierProvider

You wrote:

final counterProvider = NotifierProvider<Counter, int>(() => Counter());

✔ Why does this NOT require (ref)?

Because the constructor is different:

**NotifierProvider<TNotifier extends Notifier<T>, T>(
TNotifier Function() createNotifier
)**


So the function does not receive any arguments.

The Counter instance gets its ref from the Notifier base class, not the constructor.

Inside the Notifier:

class Counter extends Notifier<int> {
@override
int build() {
// Here you have ref automatically:
ref.watch(...)
return 0;
}
}


This is why your version works fine.

🟪 Why is the function signature different?
✔ Provider

You return a value directly → so Riverpod injects ref into that function.

✔ NotifierProvider

You return a class that already has ref — the notifier handles it internally → no need to pass ref.

🟧 Final Summary
Provider Type	                    Function Signature	    Requires ref?	        Why
Provider<T>	                        (ref) => value	        Yes	                Needs ref for lifecycle/watch/dependencies
FutureProvider / StreamProvider	    (ref) => future/stream	Yes	                Same reason as above
NotifierProvider<T, State>	        () => T()	            No	                Notifier gets ref internally
AsyncNotifierProvider<T, State>	    () => T()	            No	                Same as above


✅ Notifier vs AsyncNotifier — The Difference
1. Notifier

State type: Sync (regular values)
Build method: Returns a normal value
Lifecycle: Runs immediately, no async work allowed
State changes: state = value

✔️ Use Notifier when:

Your state is synchronous

You do not need to call APIs, databases, or any asynchronous function

Your logic is computation-based or UI-based

Example:
class Counter extends Notifier<int> {
@override
int build() => 0;

void increment() => state++;
}

final counterProvider = NotifierProvider<Counter, int>(Counter.new);


Best for:

Counters

UI selections

Filters

Toggles

Validation (non-async)

2. AsyncNotifier

State type: AsyncValue<T>
Build method: Future<T>
Lifecycle: Automatically manages loading, error, data
State changes:

state = AsyncValue.loading()

state = AsyncValue.data(value)

state = AsyncValue.error(err, stack)

✔️ Use AsyncNotifier when:

You need to fetch async data

You're calling:

API / backend

Database (local/remote)

File system

Shared preferences

You want built-in:

loading

error handling

retries

refresh

Example:
class RecipesNotifier extends AsyncNotifier<List<Recipe>> {
@override
Future<List<Recipe>> build() async {
return await api.fetchRecipes();
}

Future<void> refresh() async {
state = const AsyncValue.loading();
state = await AsyncValue.guard(() => api.fetchRecipes());
}
}

final recipesNotifierProvider =
AsyncNotifierProvider<RecipesNotifier, List<Recipe>>(RecipesNotifier.new);


Best for:

Loading recipes from API

Authentication

Pagination

Syncing server-side state

CRUD operations

🧠 How to choose quickly
If your state…	Use
Is synchronous	Notifier
Depends on async work (API/db)	AsyncNotifier
Needs loading/error handling	AsyncNotifier
Is just simple UI state	Notifier
Needs to be refreshed asynchronously	AsyncNotifier

🔥 Real-world examples
Feature	What to use?	Why
Theme toggle	Notifier	No async work
Counter	Notifier	Pure sync
Login API call	AsyncNotifier	Needs loading/error
Fetch recipes list	AsyncNotifier	Server data
Favorites toggle (local only)	Notifier	Sync UI action
Favorites toggle (API call)	AsyncNotifier	Network involved


# The .notifier syntax is available with StateProvider and StateNotifierProvider only and works as follows:

call ref.read(provider.notifier) on a StateProvider<T> to return the underlying StateController<T> that we can use to modify the state
call ref.read(provider.notifier) on a StateNotifierProvider<T> to return the underlying StateNotifier<T> so we can call methods on it

# 
** ref.listen() gives us a callback that executes when the provider value changes, not when the build method is called. Hence we can use it to run any asynchronous code (such as showing a dialog), just like we do inside button callbacks. For more info about running asynchronous code inside Flutter widgets, read my article about side effects in Flutter.

In addition to watch, read, and listen, Riverpod 2.0 introduced new methods that we can use to explicitly refresh or invalidate a provider. I will cover them in a separate article.



