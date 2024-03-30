import '../repositories/movie_repository.dart';

class GetUsersUsecase {
  final IMovieRepository _movieRepository;

  const GetUsersUsecase({
    required IMovieRepository movieRepository,
  }) : _movieRepository = movieRepository;

  Future call({
    required int id,
  }) async {
    return await _movieRepository.getUsers();
  }
}
