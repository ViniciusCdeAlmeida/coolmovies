import 'package:coolmovies/domain/entities/movie_review_entity.dart';

import '../repositories/movie_repository.dart';

class AddMovieReviewUsecase {
  final IMovieRepository _movieRepository;

  const AddMovieReviewUsecase({
    required IMovieRepository movieRepository,
  }) : _movieRepository = movieRepository;

  Future<MovieReviewEntity> call({
    required String title,
    required String userId,
    required String movieId,
    int rating = 1,
    String body = '',
  }) async {
    return await _movieRepository.addMovieReview(
      title: title,
      userId: userId,
      movieId: movieId,
      rating: rating,
      body: body,
    );
  }
}
