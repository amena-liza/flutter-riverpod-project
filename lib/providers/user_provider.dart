

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/user/user_model.dart';
import '../services/services.dart';

final userProvider = FutureProvider<List<UserModel>>((ref) async {
  return ref.watch(userDataProvider).getUsers();
});