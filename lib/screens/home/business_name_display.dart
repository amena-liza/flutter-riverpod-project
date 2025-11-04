import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_files/providers/business_name_provider.dart';

class BusinessNameDisplay extends ConsumerWidget {
  const BusinessNameDisplay({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final businessName = ref.watch(businessNameProvider);

    return Column(
      children: [
        Text("Current Business Name is: $businessName"),
        ElevatedButton(
            onPressed: () {
              ref.read(businessNameProvider.notifier).setBusinessName("Bata");
            },
            child: const Text("Update Business Name to Shoe Brand"))
      ],
    );
  }
}
