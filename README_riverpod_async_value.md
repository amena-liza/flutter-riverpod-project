# AsyncValue - Visual Mental Model
AsyncValue<T> is a sealed class that represents the state of an async operation in Riverpod.

It has exactly 3 sub-classes:
AsyncLoading<T>
AsyncData<T>
AsyncError<T>

So when you see:
AsyncValue<List<Recipe>> recipes

It means:

**“recipes can be loading, or data, or error.
All in ONE variable.”**

This is why Riverpod makes async state so clean.

Think of AsyncValue<T> like a box that can hold one of three shapes:

      AsyncValue<T>
     /      |      \
    /       |       \
AsyncLoading  AsyncData  AsyncError

All reachable through a single variable.

AsyncValue<T> → the main container (“the wrapper”)
AsyncLoading<T> → the loading state
AsyncData<T> → the success state
AsyncError<T> → the error state
AsyncValue.loading() → factory that returns AsyncLoading()
AsyncValue.data() → factory that returns AsyncData()
AsyncValue.error() → factory that returns AsyncError()
All constructors represent the same thing, just different syntax.


What is AsyncLoading()?
This represents:
“The async operation is loading.”

Equivalent to:

AsyncValue<List<Recipe>> value = const AsyncLoading();

Or written in the factory style:

AsyncValue<List<Recipe>> value = const AsyncValue.loading();

Both create an AsyncLoading.
🔹 These are the same:
const AsyncValue.loading();
const AsyncLoading();

✔ 3. What is AsyncData()?
Represents the success state.

AsyncValue<List<Recipe>> value = AsyncData(["A", "B", "C"]);
Or:
AsyncValue.data([...]);
Both create the data state.

✔ 4. What is AsyncError()?
Represents the error state.
AsyncValue.error(err, stack);

Or:

AsyncError(err, stack);

📌 Summary of all constructors
Factory constructor	        Real class instance	    Meaning
AsyncValue.loading()	    AsyncLoading()	        Loading
AsyncValue.data(data)	    AsyncData(data)	        Success
AsyncValue.error(err, st)	AsyncError(err, st)	    Error

They are identical — Riverpod just gives both styles.

🟩 5. Why use them?
✔ Store async results cleanly

Example:
state = const AsyncValue.loading();
state = AsyncValue.data(recipes);
state = AsyncValue.error(e, st);

✔ No need for separate variables

You don’t need:
bool isLoading
bool hasError
String? errorMessage
List<Recipe> data
All are in one type.

🟦 6. So why you saw code like this?
Example:
this.recipes = const AsyncValue.loading();

This simply initializes the RecipesState to loading.

Instead of:
this.recipes = const AsyncLoading();

Both result in:
AsyncLoading<List<Recipe>>

They are just different constructor styles.

🟣 7. Example of state update:
Add new item to list:
state = AsyncData([
...state.valueOrNull ?? [],
newRecipe,
]);

Here:

AsyncData() = success container
valueOrNull = underlying data
spreading adds new items


# We use:

✔ AsyncValue.data(...)
when Dart can infer the type from the value.

We use:
✔ AsyncValue<List<Recipe>>.error(...)

when Dart cannot infer the type, because the error constructor has no T parameter.
Both are correct — one simply needs the type annotation and the other does not.

You can write either:
AsyncValue.data(...)
or
AsyncValue<List<Recipe>>.data(...)

They are identical in functionality.
✔ Both produce an AsyncData<List<Recipe>>
✔ Riverpod infers the generic type automatically in most situations
✔ You only need the generic (<List<Recipe>>) when Dart cannot infer it

This is why sometimes you see it written with generic, sometimes without.
🧠 Why AsyncValue.data usually does NOT need generics

In your success branch:
``recipes: AsyncValue.data(
    refresh ? data : [...currentRecipes, ...data],
),``

Dart sees that this is assigned into:
AsyncValue<List<Recipe>>

So it can automatically infer:
The type of data is List<Recipe>
Therefore the AsyncValue inside must also be AsyncValue<List<Recipe>>

So you don’t need:

AsyncValue<List<Recipe>>.data


Dart knows it.

🔥 But why DO we need generics in AsyncValue.error?

Because error constructors need a generic argument.
Look at the signature:

AsyncValue.error(Object error, StackTrace stackTrace)


Notice:
➡ It does NOT include T anywhere
➡ Dart cannot know what the success type (T) is
➡ So you MUST specify it manually:

AsyncValue<List<Recipe>>.error(error, StackTrace.current)


Otherwise Riverpod/Dart cannot guess that this error belongs to an AsyncValue<List<Recipe>>.

📌 Why success can infer type automatically, but error cannot?

Let’s break it down:

✔ Success constructor includes the value
AsyncValue.data(T value)
So Dart can infer T from the value.

❌ Error constructor does NOT include T
AsyncValue.error(Object error, StackTrace stackTrace)
No type inside → no way to guess T.

📘 Summary Table
Constructor	                                Needs Generic?	                    Why?
AsyncValue.data(data)	                    ❌ No	                            Dart infers T from data
AsyncValue<List<Recipe>>.data(data)	        ✔ Optional	                        Explicit, but not needed
AsyncValue.error(err, st)	                ❌ No, but then T becomes dynamic	Not desired
AsyncValue<List<Recipe>>.error(err, st)	    ✔ YES	                            Dart cannot infer T
👀 Example showing the difference
✅ This works:
AsyncValue.data(<Recipe>[]);

❌ But this does NOT work:
AsyncValue.error("err", st);

Because Dart cannot know what type of AsyncValue<T> is being created.

# Yes — the main purpose of AsyncValue.guard is exactly to safely convert:

Successful data → AsyncData

Thrown exception → AsyncError (with stack trace)

But the benefit goes beyond just that.
Here is what AsyncValue.guard truly gives you:

✅ Benefits of using AsyncValue.guard
1. Prevents crashes

Without guard, if your async call throws an exception:

state = AsyncValue.data(await api.fetchRecipes());


…your provider will crash, because an exception thrown before reaching AsyncValue.data() never gets caught.

With guard:

state = await AsyncValue.guard(() => api.fetchRecipes());


Any thrown exception is automatically wrapped in an AsyncError instead of crashing.

2. UI always receives a valid AsyncValue

Regardless of success or failure, your UI gets:

AsyncData<T> on success

AsyncError<T> on error

This means your UI can consistently use:

when

maybeWhen

isLoading

hasError

valueOrNull

…without needing manual try/catch everywhere.

3. Automatically includes the stack trace

When an exception happens, Riverpod stores:

The error

The stack trace

So your UI and logs get full debugging information.

Doing it manually means you'd need:

try {
final data = await api.fetchRecipes();
state = AsyncValue.data(data);
} catch (e, st) {
state = AsyncValue.error(e, st);
}


guard avoids all that boilerplate.

4. Cleaner, safer code

One line replaces a try/catch and ensures correctness:

state = await AsyncValue.guard(() => api.fetchRecipes());


Cleaner, more readable, and harder to misuse.

📌 So why not use it in the build() method?

You can, and it is valid:

@override
Future<List<Recipe>> build() async {
return await AsyncValue.guard(() => api.fetchRecipes());
}


But it's not necessary because:

✔ build() automatically wraps thrown errors into AsyncError

Riverpod already does the equivalent of guard internally for build().

So this:

Future<List<Recipe>> build() async {
return api.fetchRecipes();
}


…already returns:

AsyncData if OK

AsyncError if exception thrown

No need for manual guarding.

📌 Why do we use guard in refresh()?

Because when you manually update state, Riverpod does NOT automatically wrap errors.

So this would crash:

state = AsyncValue.data(await api.fetchRecipes());


But this is safe:

state = await AsyncValue.guard(() => api.fetchRecipes());

🎯 In summary
Yes, the benefit is:

Converts successful data → AsyncData<T>

Converts exceptions → AsyncError<T>

Prevents crashes

Includes stack trace

Reduces boilerplate

Ensures UI always receives a valid AsyncValue<T>

Where you MUST use it

Whenever you set state manually.

Where you don’t need it

Inside build(), because Riverpod guards errors for you.

If you want, I can write a fully correct refresh() implementation for:

keeping old data during refresh

showing refresh spinner only

error handling

Just tell me!

######

✅ Comparison Table: FutureProvider vs StreamProvider vs AsyncNotifier
Feature	FutureProvider	StreamProvider	AsyncNotifier / AsyncNotifierProvider
Type of async source	One-time future (Future<T>)	Continuous values (Stream<T>)	Anything — you write async logic manually
When it runs	Runs once, or whenever dependencies change	Runs each time stream emits a value	Runs when watched/needed or based on your logic
Output type	AsyncValue<T>	AsyncValue<T>	AsyncValue<T> via build()
Can expose methods?	❌ No	❌ No	✅ Yes — exposes methods like fetch(), refresh(), etc.
Can hold state?	❌ Only returns async data	❌ Stream-driven only	✅ Yes — can store and mutate state
Retry logic?	❌ Not built-in	❌ Not built-in	✅ Built-in via your own code
Best for	API calls, one-time fetch	Realtime updates: chat, sensors	Complex async state handling
✅ How to Convert an AsyncValue<T> to a Raw Value
1. Safely read value
   final value = asyncValue.asData?.value;

2. Using .when
   asyncValue.when(
   data: (value) => print(value),
   loading: () => print("loading..."),
   error: (err, _) => print(err),
   );

3. Using .maybeWhen
   final value = asyncValue.maybeWhen(
   data: (v) => v,
   orElse: () => null,
   );

4. Using requireData (throws if loading/error)
   final raw = asyncValue.requireData;

✅ How to Test AsyncValue in Unit Tests
Example: Testing success state
test('AsyncValue success test', () {
final async = AsyncValue.data(42);

expect(async.hasValue, true);
expect(async.value, 42);
});

Error state
test('AsyncValue error test', () {
final async = AsyncValue<int>.error("Something wrong");

expect(async.hasError, true);
expect(async.error, "Something wrong");
});

Loading state
test('AsyncValue loading test', () {
final async = const AsyncValue<int>.loading();

expect(async.isLoading, true);
});

Testing a FutureProvider
final container = ProviderContainer();

test('FutureProvider returns data', () async {
final result = await container.read(myFutureProvider.future);
expect(result, equals("Hello"));
});

Testing an AsyncNotifier
test('AsyncNotifier fetch test', () async {
final container = ProviderContainer();
final notifier = container.read(myNotifierProvider.notifier);

await notifier.loadItems(); // your custom method

final state = container.read(myNotifierProvider);
expect(state.value, isNotEmpty);
});


