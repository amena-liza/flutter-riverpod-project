// import 'package:dio/dio.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'api_provider.dart';
//
// final apiRequestProvider = Provider<ApiRequestProvider>((ref) {
//   final dio = ref.read(dioProvider);
//   return ApiRequestProvider(dio);
// });
//
// class ApiRequestProvider {
//   final Dio _dio;
//
//   ApiRequestProvider(this._dio);
//
//   Future<Response> getRequest(String endpoint) async {
//     try {
//       final response = await _dio.get(endpoint);
//       return response;
//     } catch (e) {
//       throw Exception('Failed to load data');
//     }
//   }
//
//   Future<Response> postRequest(String endpoint, Map<String, dynamic> data) async {
//     try {
//       final response = await _dio.post(endpoint, data: data);
//       return response;
//     } catch (e) {
//       throw Exception('Failed to post data');
//     }
//   }
// }