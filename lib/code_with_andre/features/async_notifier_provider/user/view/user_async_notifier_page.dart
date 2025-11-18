import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../riverpod/user_async_notifier_provider.dart';

class UsersScreen extends ConsumerWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usersAsync = ref.watch(usersProvider);

    return Scaffold(
      appBar: AppBar(title: Text("Users")),
      body: usersAsync.when(
        loading: () => Center(child: CircularProgressIndicator()),
        error: (e, st) => Center(child: Text("Error: $e")),
        data: (users) => ListView(
          children: [
            for (final u in users) ListTile(title: Text(u)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(usersProvider.notifier).addUser("New User");
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
