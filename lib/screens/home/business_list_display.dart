import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_files/providers/business_provider.dart';

class BusinessListDisplay extends ConsumerWidget {
  const BusinessListDisplay({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allBusinessList = ref.watch(businessProvider);

    return Column(
      children: [
        for (var business in allBusinessList) Text(business.name),
        ElevatedButton(
            onPressed: () {
              ref
                  .read(businessProvider.notifier)
                  .addNewBusiness(const BusinessModel("Quartuz", "Watch"));
            },
            child: const Text("Add Watch Brand")),
        ElevatedButton(
            onPressed: () {
              ref.read(businessProvider.notifier).removeBusiness("Yellow");
            },
            child: const Text("Remove Clothing Brand"))
      ],
    );
  }
}
