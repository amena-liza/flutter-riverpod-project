import 'package:flutter_riverpod/flutter_riverpod.dart';

class UsersNotifier extends AsyncNotifier<List<String>> {
  @override
  Future<List<String>> build() async {
    // Initial fetch
    return fetchUsers();
  }

  Future<List<String>> fetchUsers() async {
    await Future.delayed(Duration(seconds: 2)); // simulate API delay
    return ["Alice", "Bob", "Charlie"];
  }

  Future<void> addUser(String name) async {
    state = const AsyncLoading();

    // pretend API call
    await Future.delayed(Duration(seconds: 1));

    // update state when done
    state = AsyncData([...state.valueOrNull ?? [], name]);
  }
}

final usersProvider = AsyncNotifierProvider<UsersNotifier, List<String>>(() {
  return UsersNotifier();
});
