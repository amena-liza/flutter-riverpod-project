import 'package:flutter/material.dart';
import 'package:riverpod_files/screens/notifications/notifications_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NotificationsIcon extends ConsumerWidget {
  const NotificationsIcon({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const NotificationsScreen();
        }));
      },
      icon: const Icon(Icons.circle_notifications_outlined),
    );
  }
}
