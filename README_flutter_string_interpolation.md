To display the result of a Dart expression within a Flutter Text widget, you use string interpolation. This allows you to embed variables or expressions directly into a string literal.

# 1. Basic Variable Interpolation:
   If you have a variable, you can directly embed it within a string using a dollar sign ($) followed by the variable name.
   
``String name = "Alice";
Text(
  'Hello, $name!', // Displays "Hello, Alice!"
);``

# 2. Expression Interpolation:
   If you need to evaluate an expression (e.g., perform a calculation, call a method on an object, or access properties of an object) and display its result, you enclose the expression within curly braces ({}) after the dollar sign.

``int a = 10;
int b = 5;
String message = "The sum is ";
// Displays "The sum is 15"
Text(
'$message${a + b}', 
);
// Or with a method call:
String greeting(String person) => 'Greetings, $person!';
Text(
'${greeting("Bob")}', // Displays "Greetings, Bob!"
);``

# Example:

``import 'package:flutter/material.dart';
//
void main() {
runApp(const MyApp());
}
//
class MyApp extends StatelessWidget {
const MyApp({super.key});
//
@override
Widget build(BuildContext context) {
int counter = 10;
double price = 12.99;
String product = "Flutter Widget";
//
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Expression in Text Widget')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Counter: $counter'), // Basic variable
              Text('Total cost: \$${counter * price}'), // Expression for calculation
              Text('Product details: ${product.toUpperCase()}'), // Expression for method call
            ],
          ),
        ),
      ),
    );
}
}``