import 'package:coolmovies/domain/entities/movie_list_entity.dart';
import 'package:coolmovies/domain/usecases/get_movie_list_usecase.dart';
import 'package:coolmovies/infra/repositories/movie_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../mock/domain/movie_repository_mock.mocks.dart';

void main() {
  final MovieRepository repository = MockMovieRepository();
  final GetMovieListUsecase usecase = GetMovieListUsecase(movieRepository: repository);
  final movieList = MovieListEntity.fakeList(4);

  setUp(() {
    when(repository.getMovies()).thenAnswer(
      (_) async => movieList,
    );
  });

  test('should return MovieList', () async {
    final expected = movieList;
    final actual = await usecase();
    expect(expected, actual);
    verify(repository.getMovies()).called(1);
  });
}
