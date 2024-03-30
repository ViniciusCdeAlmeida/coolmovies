import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../domain/entities/movie_list_entity.dart';
import '../../../../../../domain/usecase_providers.dart';
import '../../../../../state/state.dart';
import 'state/movie_list_notifier.dart';

final movieListNotifierProvider = StateNotifierProvider<MovieListNotifier, AppState<List<MovieListEntity>>>((ref) {
  return MovieListNotifier(ref.watch(getMoviesListUsecaseProvider));
});
