import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../asyncvalue_practice/asyncvalue_practice.dart';
import '../riverpod/class_generator.dart';

class ClassGeneratorPage extends ConsumerWidget {
  const ClassGeneratorPage({super.key, required this.pageNo});

  final int pageNo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quotesAsync = ref.watch(getQuotesProvider(page: pageNo));

    return quotesAsync.when(
      data: (quotes) => Column(
        children: [
          ElevatedButton(
              onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const AsyncValuePractice()),
                  ),
              child: const Text('Go to Second Page')),
          Expanded(
            child: ListView.builder(
              itemCount: quotes.length,
              itemBuilder: (_, i) => ListTile(
                leading: Text(quotes[i].id.toString()),
                title: Text(quotes[i].quote),
                subtitle: Text(
                  quotes[i].author,
                  style: const TextStyle(color: Colors.blue),
                ),
              ),
            ),
          )
        ],
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, st) => Center(child: Text('Error: $e')),
    );
  }
}
