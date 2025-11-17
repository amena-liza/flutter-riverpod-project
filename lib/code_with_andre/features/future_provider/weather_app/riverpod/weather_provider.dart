import 'package:flutter_riverpod/flutter_riverpod.dart';

final weatherFutureProvider = FutureProvider((ref) {
  // get weather of London

  final weatherRepository = ref.watch(weatherRepositoryProvider);
  // return weatherRepository.getWeather('London');
  return weatherRepository.getWeather(city: 'London');
});

final weatherRepositoryProvider = Provider<WeatherRepository>((ref) {
  return WeatherRepository();
});

class WeatherRepository {
  getWeather({required String city, int age = 18}) {}
}
