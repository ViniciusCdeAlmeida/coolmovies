import 'package:coolmovies/domain/entities/movie_list_entity.dart';

abstract class IMovieExternalDatasource {
  Future<List<MovieListEntity>> getMovies({
    int page = 1,
    String search = '',
  });

  Future getUsers();

  Future getMovie({
    required String id,
  });

  Future addMovieReview({
    required String title,
    required String userId,
    required String movieId,
    int rating = 1,
    String body = '',
  });
}
