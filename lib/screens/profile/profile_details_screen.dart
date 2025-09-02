import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_files/models/user/user_model.dart';

class ProfileDetailsScreen extends ConsumerWidget {
  const ProfileDetailsScreen({super.key, required this.userIndex, required this.userDetails});

  final int userIndex;
  final UserModel userDetails;

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Center(
                child: CircleAvatar(
                  maxRadius: 60,
                  backgroundImage: NetworkImage(userDetails.avatar),
                ), // CircleAvatar
              ), // Center
              Text(
                "${userDetails.firstname} ${userDetails.lastname}",
              ), // Text
              Text(userDetails.email),
            ],
          ), // Column
        ), // Padding
      ), // Center
    ); // Scaffold
  }
}
