import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../generator_from_function/riverpod/function_generator.dart';
import '../../model/model.dart';

part 'class_generator.g.dart';

@riverpod
Future<List<QuoteModel>> getQuotes(ref, {required int page}) {
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
    final response = await client.get('https://dummyjson.com/quotes');
    final responseData = response.data['quotes'] as List<dynamic>? ?? [];
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
