import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Joke {
  Joke({required this.setup, required this.punchline});
  final String setup;
  final String punchline;

  factory Joke.fromJson(Map<String, Object?> json) {
    return Joke(
      setup: json['setup']! as String,
      punchline: json['punchline']! as String,
    );
  }
}

final getJokeProvider = FutureProvider.autoDispose<Joke>((ref) async {
  final dio = Dio();

  final response = await dio.get<Map<String, Object?>>(
    'https://official-joke-api.appspot.com/random_joke',
  );
  return Joke.fromJson(response.data!);
});

final jokeApiProvider = FutureProvider<Joke>((ref) async {
  // final api = ApiService();
  return await fetchData();
});

Future<Joke> fetchData() async {
  final dio = Dio();
  final response = await dio.get<Map<String, Object?>>(
    'https://official-joke-api.appspot.com/random_joke',
  );
  return Joke.fromJson(response.data!);
}

Future<Response> apiService() async {
  final dio = Dio();
  return await dio.get<Map<String, Object?>>(
    'https://official-joke-api.appspot.com/random_joke',
  );
}
