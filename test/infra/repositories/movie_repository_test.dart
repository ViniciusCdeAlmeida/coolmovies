import 'package:coolmovies/domain/entities/movie_detail_entity.dart';
import 'package:coolmovies/domain/entities/movie_list_entity.dart';
import 'package:coolmovies/domain/entities/movie_review_entity.dart';
import 'package:coolmovies/infra/repositories/movie_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../../mock/external/movie_external_datasource_mock.mocks.dart';

void main() {
  final external = MockMovieExternalDatasource();
  final MovieRepository repository = MovieRepository(movieExternalDatasource: external);
  final fakeList = MovieListEntity.fakeList(3);
  final fakeMovie = MovieDetailEntity.fake();
  final fakeReview = MovieReviewEntity.fake();

  group('#getMovies', () {
    setUp(() {
      when(external.getMovies()).thenAnswer(
        (_) async => fakeList,
      );
    });

    test('should return MovieListEntity', () async {
      final actual = await repository.getMovies();
      final expected = [
        MovieListEntity(
          id: fakeList.first.id,
          title: fakeList.first.title,
          image: fakeList.first.image,
        )
      ];
      expect(actual.first.id, expected.first.id);
      verify(external.getMovies()).called(1);
    });
  });

  group('#addReview', () {
    setUp(() {
      when(external.addMovieReview(
        title: fakeReview.title,
        userId: fakeReview.user.id,
        movieId: '321',
        rating: fakeReview.count,
        body: fakeReview.body,
      )).thenAnswer(
        (_) async => fakeReview,
      );
    });

    test('should return MovieReviewEntity', () async {
      await repository.addMovieReview(
        title: fakeReview.title,
        userId: fakeReview.user.id,
        movieId: '321',
        rating: fakeReview.count,
        body: fakeReview.body,
      );
      final expected = await external.addMovieReview(
        title: fakeReview.title,
        userId: fakeReview.user.id,
        movieId: '321',
        rating: fakeReview.count,
        body: fakeReview.body,
      );

      expect(expected, isA<MovieReviewEntity>());
      expect(expected.title, fakeReview.title);
      expect(expected.count, fakeReview.count);
      expect(expected.body, fakeReview.body);

      verify(external.addMovieReview(
        title: fakeReview.title,
        userId: fakeReview.user.id,
        movieId: '321',
        rating: fakeReview.count,
        body: fakeReview.body,
      )).called(2);
    });
  });

  group('#movieDetail', () {
    setUp(() {
      when(
        external.getMovie(
          id: fakeMovie.id,
        ),
      ).thenAnswer(
        (_) async => fakeMovie,
      );
    });

    test('should return MovieDetailEntity', () async {
      final actual = await repository.getMovie(id: fakeMovie.id);
      final expected = MovieDetailEntity(
        id: fakeMovie.id,
        title: fakeMovie.title,
        image: fakeMovie.image,
        releaseDate: fakeMovie.releaseDate,
        movieReviews: fakeMovie.movieReviews,
      );

      expect(actual, isA<MovieDetailEntity>());
      expect(actual, expected);

      verify(external.getMovie(id: fakeMovie.id)).called(1);
    });
  });

  group('#removeMovieReview', () {
    setUp(() {
      when(external.removeMovieReview(reviewId: fakeReview.id)).thenAnswer((_) async => {});
    });

    test('should return void', () async {
      await repository.removeMovieReview(reviewId: fakeReview.id);
      verify(external.removeMovieReview(reviewId: fakeReview.id)).called(1);
    });
  });
}
