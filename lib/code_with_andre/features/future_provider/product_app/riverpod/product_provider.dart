import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../parts/services.dart';

// Want to get the result from an API call that returns a Future?
// Then just create a FutureProvider like this:

final beautyProductFutureProvider = FutureProvider.autoDispose<Response>((ref) {
  // get Beauty product
  final remote = ref.watch(restClientServiceProvider);
  return remote.getProductByCategory(category: 'beauty');
});

// FutureProvider is very powerful, and you can use it to:
//
// perform and cache asynchronous operations (such as network requests)
// handle the error and loading states of asynchronous operations
// combine multiple asynchronous values into another value
// re-fetch and refresh data (useful for pull-to-refresh operations)
