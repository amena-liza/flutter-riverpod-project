import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/products_provider.dart';

class PriceDisplay extends ConsumerWidget {
  const PriceDisplay({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final staticPrice = ref.read(priceProvider);
    final statefulPrice = ref.watch(sateFulPriceProvider);
    final discountedPrice = ref.watch(discountedPriceProvider);

    return Column(
      children: [
        Text('Current Static Price is: $staticPrice \n'),
        Text('Current Stateful Price is: $statefulPrice \n'),
        Text('The Discounted Price is : $discountedPrice \n'),
        ElevatedButton(
          onPressed: () {
            ref.read(sateFulPriceProvider.notifier).state = 200;
          },
          child: const Text('Set Price to 200'),
        ),
      ],
    );
  }
}
