import 'package:coolmovies/domain/entities/movie_list_entity.dart';

import '../repositories/movie_repository.dart';

class GetMovieListUsecase {
  final IMovieRepository _movieRepository;

  const GetMovieListUsecase({
    required IMovieRepository movieRepository,
  }) : _movieRepository = movieRepository;

  Future<List<MovieListEntity>> call({
    int page = 1,
    String search = '',
  }) async {
    return await _movieRepository.getMovies(
      page: page,
      search: search,
    );
  }
}
