import 'package:coolmovies/external/proxies/api_proxy.dart';
import 'package:coolmovies/external/queries/movie_queries.dart';
import 'package:coolmovies/infra/datasources/movie_external_datasource.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class MovieExternalDatasource implements IMovieExternalDatasource {
  final ApiProxy _apiProxy;

  MovieExternalDatasource({
    required ApiProxy apiProxy,
  }) : _apiProxy = apiProxy;

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
}
