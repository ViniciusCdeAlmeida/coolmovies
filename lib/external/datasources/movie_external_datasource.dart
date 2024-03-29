import 'package:graphql_flutter/graphql_flutter.dart';

import '../../infra/datasources/movie_external_datasource.dart';
import '../proxies/api_proxy.dart';
import '../queries/movie_queries.dart';

class MovieExternalDatasource implements IMovieExternalDatasource {
  final ApiProxy _apiProxy;

  MovieExternalDatasource({
    required ApiProxy apiProxy,
  }) : _apiProxy = apiProxy;

  @override
  Future getMovies({
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

    return response;
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
  Future getMovie({
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

    return response;
  }

  @override
  Future addMovieReview({
    required String title,
    required String userId,
    required String movieId,
    int rating = 1,
    String body = '',
  }) async {
    final response = await _apiProxy.query(
      QueryOptions(
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

    return response;
  }
}
