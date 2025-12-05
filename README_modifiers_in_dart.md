Here’s the clearest and most practical explanation of final vs const in Dart, especially for Flutter apps:

🔥 Dart: final vs const — Simple & Developer-Friendly Explanation
✅ 1. final → One-time assignable (runtime constant)

A final variable can be assigned only once, but its value is allowed to be computed at runtime.

Example:
final time = DateTime.now(); // allowed

👉 Key points:
Value is fixed after assignment
Computed at runtime
Cannot change later
Commonly used for class properties

✅ 2. const → Compile-time constant

A const value must be known at compile time.
Dart allocates const objects in memory only once (canonicalized).

Example:
const pi = 3.14159; // must be known at compile time

👉 Key points:
Value must be compile-time constant
Cannot depend on runtime values (DateTime.now(), user input, API values)
More optimized in memory

🆚 final vs const (Side-by-side)
Feature	                        final	const
Assignable once?	            ✅ Yes	✅ Yes
Runtime value allowed?      	✅ Yes	❌ No
Compile-time constant required?	❌ No	✅ Yes
Creates canonical instances?	❌ No	✅ Yes
Typical usage	            final: Class fields, values computed at runtime	                                                const: Widgets, immutable objects, config constants
🏗️ In Flutter Widgets
Example:
const Text("Hello"); // good, compile-time constant

Using const widget improves performance because Flutter reuses it instead of rebuilding.

**🧠 Analogy
Type	Analogy
final	“I receive the value once during the app runtime — after that, it’s fixed.”
const	“I was born with this value — it will never change.”**

🧱 Class Example With final
Why class fields are usually final:
class Quote {
final String text;
final String author;

Quote(this.text, this.author);
}


👉 You want values to be immutable once created, but they may come from runtime (API, DB).

That’s why most model classes use final, NOT const.

❗ When to use const for classes?

Only when all fields are final AND values are known at compile time.

Example:

class AppConfig {
final String appName;
const AppConfig(this.appName);
}

const appConfig = AppConfig("MyApp"); // OK

**🚀 Quick Rules (Memorize This)**
_Use const when:_
Value NEVER changes
Known at compile time
Used inside widgets for optimization
Literals: const [], const {}, const MyWidget()

_Use final when:_
Value assigned only once
Comes from API, DB, user input, device, date-time
Class fields in models

Yes, final and const are modifiers.
Dart variable declaration modifiers include:
final
const
late
static
required
abstract
factory
external
covariant
sealed, interface, base, final class, etc.

**Common Dart declaration modifiers**

| Modifier                        | Meaning                                                   | Applies to                                           |
| ------------------------------- | --------------------------------------------------------- | ---------------------------------------------------- |
| **final**                       | Value is set once at runtime; cannot be changed afterward | Variables, fields, classes (sealed, interface, etc.) |
| **const**                       | Compile-time constant; value is deeply immutable          | Variables, constructors, classes                     |
| **late**                        | Initialized later, not at declaration time                | Variables, fields                                    |
| **required**                    | Named parameter must be provided                          | Function & constructor params                        |
| **static**                      | Belongs to the class, not instances                       | Fields & methods                                     |
| **abstract**                    | Cannot be instantiated                                    | Classes, methods                                     |
| **extends / implements / with** | Type modifiers for inheritance                            | Classes                                              |
| **factory**                     | Returns an instance from some logic                       | Constructors                                         |
| **covariant**                   | Allows loosening parameter types in overrides             | Parameters                                           |
| **external**                    | Declared elsewhere (FFI, platform code)                   | Functions, getters, setters                          |
| **sealed**                      | Class cannot be extended outside library                  | Classes                                              |
| **base**                        | Class can be extended but not implemented                 | Classes                                              |
| **interface**                   | Class can be implemented but not extended                 | Classes                                              |
| **final class**                 | Class cannot be extended nor implemented                  | Classes                                              |
| **mixin**                       | Defines a mixin                                           | Classes                                              |
