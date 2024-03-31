import 'package:coolmovies/domain/entities/movie_review_entity.dart';
import 'package:coolmovies/domain/usecases/remove_movie_review_usecase.dart';
import 'package:coolmovies/infra/repositories/movie_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../mock/domain/movie_repository_mock.mocks.dart';

void main() {
  final MovieRepository repository = MockMovieRepository();
  final RemoveMovieReviewUsecase usecase = RemoveMovieReviewUsecase(movieRepository: repository);
  final movie = MovieReviewEntity.fake();

  setUp(() {
    when(repository.removeMovieReview(reviewId: movie.id)).thenAnswer(
      (_) async => movie,
    );
  });

  test('should return MovieDetail', () async {
    await usecase(reviewId: movie.id);
    verify(repository.removeMovieReview(reviewId: movie.id)).called(1);
  });
}
