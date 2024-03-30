import 'package:coolmovies/domain/entities/movie_list_entity.dart';
import 'package:coolmovies/domain/usecase_providers.dart';
import 'package:coolmovies/presenter/pages/movies/pages/list/provider/state/movie_list_notifier.dart';
import 'package:coolmovies/presenter/state/state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final movieNotifierProvider = StateNotifierProvider<MovieListNotifier, AppState<List<MovieListEntity>>>((ref) {
  return MovieListNotifier(ref.watch(getMoviesListUsecaseProvider));
});
