import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../domain/entities/movie_detail_entity.dart';
import '../../../../../../domain/usecase_providers.dart';
import '../../../../../state/state.dart';
import 'state/movie_add_review_notifier.dart';

final movieAddReviewNotifierProvider = StateNotifierProvider.family
    .autoDispose<MovieAddReviewNotifier, AppState<MovieDetailEntity>, MovieDetailEntity>((ref, movieId) {
  return MovieAddReviewNotifier(ref.watch(addReviewUsecaseProvider), movieId);
});
