import 'package:flutter/material.dart';
import 'package:riverpod_files/screens/profile/profile_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileIcon extends ConsumerWidget {
  const ProfileIcon({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      child: const Stack(
          children: [Padding(
            padding: const EdgeInsets.only(right: 20),
            child: CircleAvatar(
              backgroundColor: Colors.deepPurple,
              radius: 22,
              child: const Text(
                "S",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ]
      ),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const ProfileScreen();
        }));
      }
    );



  }
}
