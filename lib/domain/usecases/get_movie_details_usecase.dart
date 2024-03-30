import '../entities/movie_detail_entity.dart';
import '../repositories/movie_repository.dart';

class GetMovieDetailsUsecase {
  final IMovieRepository _movieRepository;

  const GetMovieDetailsUsecase({
    required IMovieRepository movieRepository,
  }) : _movieRepository = movieRepository;

  Future<MovieDetailEntity> call({
    required String id,
  }) async {
    return await _movieRepository.getMovie(
      id: id,
    );
  }
}
