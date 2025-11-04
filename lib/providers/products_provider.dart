import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_files/models/product.dart';

part 'products_provider.g.dart';

const List<Product> allProducts = [
  Product(
      id: '1',
      title: 'Groovy Shorts',
      price: 12,
      image: 'assets/products/shorts.png'),
  Product(
      id: '2',
      title: 'Karati Kit',
      price: 34,
      image: 'assets/products/karati.png'),
  Product(
      id: '3',
      title: 'Denim Jeans',
      price: 54,
      image: 'assets/products/jeans.png'),
  Product(
      id: '4',
      title: 'Red Backpack',
      price: 14,
      image: 'assets/products/backpack.png'),
  Product(
      id: '5',
      title: 'Drum & Sticks',
      price: 29,
      image: 'assets/products/drum.png'),
  Product(
      id: '6',
      title: 'Blue Suitcase',
      price: 44,
      image: 'assets/products/suitcase.png'),
  Product(
      id: '7',
      title: 'Roller Skates',
      price: 52,
      image: 'assets/products/skates.png'),
  Product(
      id: '8',
      title: 'Electric Guitar',
      price: 79,
      image: 'assets/products/guitar.png'),
];

// final productsProvider = Provider((ref) {
//   return allProducts;
// });

// final reducedProductsProvider = Provider((ref) {
//   return allProducts.where((p) => p.price < 50).toList();
// });

// Here the priceProvider is readOnly; It's value is fixed and can't change directly
// final priceProvider = Provider<int>((ref) => 100);

// With riverpod annotation the above line can be written as below as well:

@riverpod
int price(ref) {
  return 100;
}

final sateFulPriceProvider = StateProvider<int>((ref) => 100);

// Rule of Thumb
// Use Provider → fixed value, no updates.
// Use StateProvider → simple mutable value (int, String, bool, etc.).
// Use StateNotifierProvider or NotifierProvider → for more complex state logic (objects, lists, multiple operations).

final discountedPriceProvider = Provider((ref) {
  final price = ref.watch(sateFulPriceProvider);
  return (price * 0.9).toInt();
});

// Explanation:
// ref.watch(priceProvider) or ref.watch(sateFulPriceProvider) doesn’t just get the current value.
// It subscribes discountedPrice to priceProvider.
// If priceProvider ever changes, discountedPrice automatically recomputes.

// Key difference: read vs watch
// Method	              | What it does	                        | Updates automatically?
// ref.read(provider)	  Just get current value once   	          ❌ No
// ref.watch(provider)	Get value and subscribe to changes	      ✅ Yes

// So when someone says “ref is used to listen to changes”,
// they mean using ref.watch(...) inside a provider to reactively recompute
// whenever the watched provider updates.

@riverpod
Product product(ref) {
  return allProducts[0];
}

@riverpod
List<Product> products(ref) {
  return allProducts;
}

@riverpod
List<Product> reducedProducts(ref) {
  return allProducts.where((p) => p.price < 50).toList();
}
