import 'package:coolmovies/domain/repositories/movie_repository.dart';
import 'package:coolmovies/external/datasources/movie_external_provider.dart';
import 'package:coolmovies/infra/repositories/movie_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final movieRepositoryProvider = Provider<IMovieRepository>(
  (ref) {
    return MovieRepository(movieExternalDatasource: ref.read(movieExternalProvider));
  },
);
