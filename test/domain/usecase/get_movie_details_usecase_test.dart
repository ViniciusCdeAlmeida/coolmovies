import 'package:coolmovies/domain/entities/movie_detail_entity.dart';
import 'package:coolmovies/domain/usecases/get_movie_details_usecase.dart';
import 'package:coolmovies/infra/repositories/movie_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../mock/domain/movie_repository_mock.mocks.dart';

void main() {
  final MovieRepository repository = MockMovieRepository();
  final GetMovieDetailsUsecase usecase = GetMovieDetailsUsecase(movieRepository: repository);
  final movie = MovieDetailEntity.fake();

  setUp(() {
    when(repository.getMovie(id: movie.id)).thenAnswer(
      (_) async => movie,
    );
  });

  test('should return MovieDetail', () async {
    final expected = movie;
    final actual = await usecase(id: movie.id);
    expect(expected, actual);
    verify(repository.getMovie(id: movie.id));
  });
}
