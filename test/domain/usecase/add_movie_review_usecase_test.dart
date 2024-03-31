import 'package:coolmovies/domain/entities/movie_review_entity.dart';
import 'package:coolmovies/domain/usecases/add_movie_review_usecase.dart';
import 'package:coolmovies/infra/repositories/movie_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../mock/domain/movie_repository_mock.mocks.dart';

void main() {
  final MovieRepository repository = MockMovieRepository();
  final AddMovieReviewUsecase usecase = AddMovieReviewUsecase(movieRepository: repository);
  final movieReview = MovieReviewEntity.fake();

  setUp(() {
    when(repository.addMovieReview(
      movieId: movieReview.id,
      title: movieReview.title,
      userId: movieReview.user.id,
      body: movieReview.body,
      rating: movieReview.count,
    )).thenAnswer((_) async => movieReview);
  });

  test('should return MovieReviewEntity', () async {
    final expected = await usecase(
      movieId: movieReview.id,
      title: movieReview.title,
      userId: movieReview.user.id,
      body: movieReview.body,
      rating: movieReview.count,
    );
    final actual = movieReview;
    expect(expected, actual);
    verify(repository.addMovieReview(
      movieId: movieReview.id,
      title: movieReview.title,
      userId: movieReview.user.id,
      body: movieReview.body,
      rating: movieReview.count,
    ));
  });
}
