// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:riverpod_files/application/api_request_provider.dart';
//
// class PostsScreen extends ConsumerWidget {
//   const PostsScreen({super.key});
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final apiProvider = ref.watch(apiRequestProvider);
//
//     return Scaffold(
//       appBar: AppBar(title: const Text('API Example')),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () async {
//             final response = await apiProvider.getRequest('/example-endpoint');
//             // Handle the response or update the state
//           },
//           child: const Text('Fetch Data'),
//         ),
//       ),
//     );
//   }
// }
