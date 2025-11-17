import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../services/network/endpoints.dart';
import '../services/network/rest_client.dart';
import 'externals.dart';

final restClientServiceProvider = Provider<RestClient>((ref) {
  return RestClient(
    ref.read(dioProvider),
    baseUrl: Endpoints.base, // Add baseUrl parameter
  );
});
