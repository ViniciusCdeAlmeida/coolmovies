import 'package:coolmovies/domain/entities/movie_review_entity.dart';
import 'package:coolmovies/external/mappers/movie_review_mapper.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../domain/entities/movie_detail_entity.dart';
import '../../domain/entities/movie_list_entity.dart';
import '../../infra/datasources/movie_external_datasource.dart';
import '../mappers/movie_details_mapper.dart';
import '../mappers/movie_list_mapper.dart';
import '../proxies/api_proxy.dart';
import '../queries/movie_queries.dart';

class MovieExternalDatasource implements IMovieExternalDatasource {
  final ApiProxy _apiProxy;

  MovieExternalDatasource({
    required ApiProxy apiProxy,
  }) : _apiProxy = apiProxy;

  @override
  Future<List<MovieListEntity>> getMovies({
    int page = 1,
    String search = '',
  }) async {
    final response = await _apiProxy.query(
      QueryOptions(
        document: gql(
          MovieQueries.getMovies(),
        ),
      ),
    );

    return (response.data!['allMovies']['nodes'] as Iterable).map((movie) {
      return MovieListMapper.fromMap(movie);
    }).toList();
  }

  @override
  Future getUsers() async {
    final response = await _apiProxy.query(
      QueryOptions(
        document: gql(
          MovieQueries.getUsers(),
        ),
      ),
    );

    return response;
  }

  @override
  Future<MovieDetailEntity> getMovie({
    required String id,
  }) async {
    final response = await _apiProxy.query(
      QueryOptions(
        document: gql(
          MovieQueries.getMovieDetails(
            id: id,
          ),
        ),
      ),
    );
    return MovieDetailMapper.fromMap(response.data!['movieById']);
  }

  @override
  Future<MovieReviewEntity> addMovieReview({
    required String title,
    required String userId,
    required String movieId,
    int rating = 1,
    String body = '',
  }) async {
    final response = await _apiProxy.mutate(
      MutationOptions(
        document: gql(
          MovieQueries.addMovieReviews(
            title: title,
            userId: userId,
            movieId: movieId,
            rating: rating,
            body: body,
          ),
        ),
      ),
    );

    return MovieReviewMapper.fromMap(response.data!['createMovieReview']['movieReview']);
  }

  @override
  Future<void> removeMovieReview({
    required String reviewId,
  }) async {
    await _apiProxy.mutate(
      MutationOptions(
        document: gql(
          MovieQueries.removeMovieReview(
            reviewId: reviewId,
          ),
        ),
      ),
    );
  }
}
