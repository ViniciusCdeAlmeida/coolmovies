import '../repositories/movie_repository.dart';

class RemoveMovieReviewUsecase {
  final IMovieRepository _movieRepository;

  const RemoveMovieReviewUsecase({
    required IMovieRepository movieRepository,
  }) : _movieRepository = movieRepository;

  Future<void> call({
    required String reviewId,
  }) async {
    return await _movieRepository.removeMovieReview(
      reviewId: reviewId,
    );
  }
}
