import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'function_generator.g.dart';

final dioOwnProvider = Provider((ref) {
  return Dio();
});

@riverpod
Dio dio(ref) {
  return Dio();
}
