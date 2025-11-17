In Dart, which is the language Flutter uses, function parameters can be defined in several ways:
# 1. Required Positional Parameters:
   These are the most common type of parameters. They must be provided in the order they are declared when calling the function.

``
void greet(String name, int age) {
print('Hello, $name! You are $age years old.');
}
``
// Calling the function
greet('Alice', 30);

# 2. Optional Positional Parameters:
   These parameters are enclosed in square brackets [] and can be omitted when calling the function. You can also provide a default value for them.

``void sayHello(String name, [String greeting = 'Hi']) {
print('$greeting, $name!');
}``

// Calling the function
sayHello('Bob'); // Output: Hi, Bob!
sayHello('Charlie', 'Hey'); // Output: Hey, Charlie!

# 3. Named Parameters:
   These parameters are enclosed in curly braces {} and are identified by their name when calling the function. They can be marked as required to ensure they are always provided.

``void displayUserInfo({required String username, int? score}) {
print('Username: $username');
if (score != null) {
print('Score: $score');
}
}``

// Calling the function
displayUserInfo(username: 'user123');
displayUserInfo(username: 'admin', score: 100);

# 4. Functions as Parameters (Callbacks):
   You can pass functions as arguments to other functions, which is a common pattern in Flutter for handling events and callbacks.

``void performAction(Function callback) {
print('Performing action...');
callback();
}``

``void myCallback() {
print('Callback executed!');
}``

``// Calling the function with a callback
performAction(myCallback);``