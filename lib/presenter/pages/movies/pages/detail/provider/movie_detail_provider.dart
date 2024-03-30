import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../domain/entities/movie_detail_entity.dart';
import '../../../../../../domain/usecase_providers.dart';
import '../../../../../state/state.dart';
import 'state/movie_detail_notifier.dart';

final movieDetailNotifierProvider =
    StateNotifierProvider.family.autoDispose<MovieDetailNotifier, AppState<MovieDetailEntity>, String>((ref, movieId) {
  return MovieDetailNotifier(
    ref.watch(getMovieDetailsUsecaseProvider),
    ref.watch(removeMovieReviewUsecaseProvider),
    movieId,
  );
});
