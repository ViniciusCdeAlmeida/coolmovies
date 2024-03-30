import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../domain/entities/movie_list_entity.dart';
import '../../../../../../domain/usecase_providers.dart';
import '../../../../../state/state.dart';
import 'state/movie_detail_notifier.dart';

final movieDetailNotifierProvider =
    StateNotifierProviderFamily<MovieDetailNotifier, AppState<MovieListEntity>, String>((ref, movieId) {
  return MovieDetailNotifier(ref.watch(getMovieDetailsUsecaseProvider), movieId);
});
