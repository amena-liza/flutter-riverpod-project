import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

final helloWorldProvider = Provider<String>((ref) {
  return 'Hello world!';
});

final dateTimeFormaterProvider = Provider<DateFormat>((ref) {
  return DateFormat.MMMEd();
});
