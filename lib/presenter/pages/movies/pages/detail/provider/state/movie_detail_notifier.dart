import 'package:coolmovies/domain/entities/movie_review_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../../domain/entities/movie_detail_entity.dart';
import '../../../../../../../domain/usecases/get_movie_details_usecase.dart';
import '../../../../../../state/state.dart';

class MovieDetailNotifier extends StateNotifier<AppState<MovieDetailEntity>> {
  final GetMovieDetailsUsecase _getMovieDetailsUsecase;
  final String movieId;

  MovieDetailNotifier(
    this._getMovieDetailsUsecase,
    this.movieId,
  ) : super(
          const AppState.init(),
        ) {
    getMovieDetails(movieId);
  }

  Future<void> getMovieDetails(String movieId) async {
    try {
      state = const AppState.loading();
      final movieDetails = await _getMovieDetailsUsecase(id: movieId);
      await Future.delayed(const Duration(seconds: 5));
      state = AppState.success(movieDetails);
    } on Exception catch (e) {
      state = AppState.error(e);
    }
  }

  Future<void> addNewReview(MovieReviewEntity newReview) async {
    try {
      state.data!.movieReviews.add(newReview);
      await Future.delayed(const Duration(seconds: 5));
      state = AppState.success(state.data!);
    } on Exception catch (e) {
      state = AppState.error(e);
    }
  }

  @override
  void dispose() {
    if (!mounted) {
      super.dispose();
    }
  }
}
