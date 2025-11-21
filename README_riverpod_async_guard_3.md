AsyncValue.guard converts:
successful data → AsyncData
thrown exception → AsyncError
This ensures your UI still receives proper AsyncValue states.

why use AsyncValue.guard?
Because inside notifier methods, Riverpod does not automatically convert exceptions into an AsyncError.
An exception thrown inside below refresh() would crash the method instead of updating UI safely.

Example without guard:
Future<void> refresh() async {
   state = const AsyncValue.loading();
   state = AsyncValue.data(await api.fetchRecipes()); // If this throws → crash
}

So we write:
state = await AsyncValue.guard(() => api.fetchRecipes());

✅ Why we don’t use AsyncValue.guard in build()
Because Riverpod automatically wraps the return value of build() in an AsyncValue, as long as the method is async.
Example:
`
class RecipesNotifier extends AsyncNotifier<List<Recipe>> {
   @override
   Future<List<Recipe>> build() async {
   return api.fetchRecipes();   // No need for AsyncValue.guard()
   }
}`

Since the method returns a Future, Riverpod automatically handles:
loading state while the Future is pending
data state when completed
error state if the Future throws
So build() already behaves like AsyncValue.guard() — nothing extra needed.

✅ Then why use AsyncValue.guard inside refresh()?

Because inside notifier methods, Riverpod does not automatically convert exceptions into an AsyncError.

An exception thrown inside refresh() would crash the method instead of updating UI safely.

Example without guard:

Future<void> refresh() async {
state = const AsyncValue.loading();
state = AsyncValue.data(await api.fetchRecipes()); // If this throws → crash
}


So we write:

state = await AsyncValue.guard(() => api.fetchRecipes());


AsyncValue.guard converts:

successful data → AsyncData

thrown exception → AsyncError

This ensures your UI still receives proper AsyncValue states.

✅ Summary
Location	Is error handled automatically?	Needs AsyncValue.guard?	Why
build()	✔️ YES (because it returns Future)	❌ NO	Riverpod turns it into AsyncValue automatically
refresh(), add(), update()…	❌ NO	✔️ YES	To convert exceptions into AsyncError safely
📌 Final rule of thumb
Use AsyncValue.guard in any method where you manually set state.
Do not use it in build() — Riverpod already handles it.

# What is the benefit of using AsyncGuard then? Does it is for converting
successful data → AsyncData
thrown exception → AsyncError

Yes — the main purpose of AsyncValue.guard is exactly to safely convert:

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

`try {
final data = await api.fetchRecipes();
state = AsyncValue.data(data);
} catch (e, st) {
state = AsyncValue.error(e, st);
}`
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