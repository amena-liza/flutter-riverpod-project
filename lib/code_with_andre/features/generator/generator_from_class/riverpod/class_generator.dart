import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../generator_from_function/riverpod/function_generator.dart';
import '../../model/model.dart';

part 'class_generator.g.dart';

@riverpod
Future<List<QuoteModel>> getQuotes(ref, {required int page}) {
  final link = ref.keepAlive();

  final timer = Timer(const Duration(seconds: 10), () {
    link.close();
  });

  ref.onDispose(() {
    print("Provider disposed");
    timer.cancel();
  });
  return ref.watch(quotesRepositoryProvider).getQuotes(page: page);
}

@riverpod
QuotesRepository quotesRepository(ref) => QuotesRepository(
      client: ref.read(dioProvider),
      apiKey: 'MYAPIKEY',
    );

class QuotesRepository {
  QuotesRepository({required this.client, required this.apiKey});

  final Dio client;
  final String apiKey;

  // get the "now playing" quotes (paginated)
  Future<List<QuoteModel>> getQuotes({required int page}) async {
    print("getQuotes started...");
    await Future.delayed(const Duration(seconds: 3));
    print("API calling now...");
    final response = await client.get('https://dummyjson.com/quotes');
    final responseData = response.data['quotes'] as List<dynamic>? ?? [];
    print("API response received.");
    return responseData.map((item) => QuoteModel.formJson(item)).toList();
    // as List<QuoteModel>;
  }

  Future<List<QuoteModel>> searchQuotes(
      {required int page, String query = ''}) async {
    return throw UnimplementedError();
  }

  // get the quote for a given id
  Future<QuoteModel> quote({required int quoteId}) async {
    return throw UnimplementedError();
  }
}

// Examples with Movie Provider //

// manualMovie Provider
final manualMovieProvider =
    FutureProvider.autoDispose.family<Response, int>((ref, int movieId) {
  return ref.watch(moviesRepositoryProvider).movie(movieId: movieId);
});

// final getAllMoviesProvider = FutureProvider.autoDispose<TMDBMovie>((ref) {
//   return ref.watch(moviesRepositoryProvider).getMovies();
// });

// We can convert above code as below to use the @riverpod annotation:

// generatedMovie Provider
@riverpod
Future<Response> generatedMovie(ref, {required int movieId}) {
  return ref.watch(moviesRepositoryProvider).movie(movieId: movieId);
}

@riverpod
MoviesRepository moviesRepository(ref) {
  return const MoviesRepository();
}

class MoviesRepository {
  const MoviesRepository();
  getMovies() {
    return ['Movie One', 'Movie Two', 'Movie Three'];
  }

  Future<Response> movie({required int movieId}) async {
    final result = await Dio().get('https://dummyjson.com/quotes/$movieId');
    return result.data;
    // return Dio().get('http://movies.com/$movieId');
  }
}

// In fact, if we have a method that returns a Stream, we can create the corresponding provider like this:

@riverpod
Stream<int> values(ref) {
  return Stream.fromIterable([1, 2, 3]);
}

// New in Riverpod 2.3: StreamNotifier
// https://codewithandrea.com/articles/flutter-riverpod-async-notifier/#new-in-riverpod-23-streamnotifier

// ASYNC NOTIFIER CLASS EXAMPLE
class AuthRepository {
  AuthRepository();
  Future<void> signInAnonymously() async {}
}

@riverpod
AuthRepository authRepository() {
  return AuthRepository();
}

class AuthController extends StateNotifier<AsyncValue<void>> {
  AuthController(this.ref)
      // set the initial state (synchronously)
      : super(const AsyncData(null));
  final Ref ref;

  Future<void> signInAnonymously() async {
    // read the repository using ref
    final authRepository = ref.read(authRepositoryProvider);
    // set the loading state
    state = const AsyncLoading();
    // sign in and update the state (data or error)
    state = await AsyncValue.guard(authRepository.signInAnonymously);
  }
}

final authControllerProvider =
    AsyncNotifierProvider.autoDispose<AuthControllerTwo, FutureOr<void>>(
        AuthControllerTwo.new);

class AuthControllerTwo extends AutoDisposeAsyncNotifier<void> {
  @override
  FutureOr<void> build() {
    // return null;
    // return const AsyncData(null);
  }

  Future<void> signInAnonymously() async {
    // read the repository using ref
    final authRepository = ref.read(authRepositoryProvider);
    // set the loading state
    state = const AsyncLoading();
    // sign in and update the state (data or error)
    state = await AsyncValue.guard(authRepository.signInAnonymously);
  }
}

@riverpod
class AuthControllerThree extends _$AuthControllerThree {
  @override
  FutureOr<void> build() async {
    return;
  }

  Future<void> signInAnonymously() async {
    // read the repository using ref
    final authRepository = ref.read(authRepositoryProvider);
    // set the loading state
    state = const AsyncLoading();
    // sign in and update the state (data or error)
    state = await AsyncValue.guard(authRepository.signInAnonymously);
  }
}

class CounterNotifier extends AsyncNotifier<int> {
  @override
  Future<int> build() async {
    return 0;
  }

  Future<void> increment() async {
    state = const AsyncLoading(); // <--- This is the case you’re asking about
    await Future.delayed(Duration(seconds: 2));
    state = AsyncData(state.value! + 1);
  }
}

/*class SomeWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
  // returns AsyncLoading on first load,
  // rebuilds with the new value when the initialization is complete
  final valueAsync = ref.watch(someOtherControllerProvider);
  return valueAsync.when(...);
  }
}*/
