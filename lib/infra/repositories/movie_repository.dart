import '../../domain/repositories/movie_repository.dart';
import '../datasources/movie_external_datasource.dart';

class MovieRepository implements IMovieRepository {
  final IMovieExternalDatasource _movieExternalDatasource;

  MovieRepository({
    required IMovieExternalDatasource movieExternalDatasource,
  }) : _movieExternalDatasource = movieExternalDatasource;

  @override
  Future getMovies({
    int page = 1,
    String search = '',
  }) async {
    return await _movieExternalDatasource.getMovies(
      page: page,
      search: search,
    );
  }

  @override
  Future getUsers() async {
    return await _movieExternalDatasource.getUsers();
  }

  @override
  Future getMovie({
    required String id,
  }) async {
    return await _movieExternalDatasource.getMovie(
      id: id,
    );
  }

  @override
  Future addMovieReview({
    required String title,
    required String userId,
    required String movieId,
    int rating = 1,
    String body = '',
  }) async {
    return await _movieExternalDatasource.addMovieReview(
      title: title,
      userId: userId,
      movieId: movieId,
      rating: rating,
      body: body,
    );
  }
}
