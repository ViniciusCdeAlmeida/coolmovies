import 'package:coolmovies/domain/entities/movie_review_entity.dart';
import 'package:coolmovies/domain/usecases/remove_movie_review_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../../domain/entities/movie_detail_entity.dart';
import '../../../../../../../domain/usecases/get_movie_details_usecase.dart';
import '../../../../../../state/state.dart';

class MovieDetailNotifier extends StateNotifier<AppState<MovieDetailEntity>> {
  final GetMovieDetailsUsecase _getMovieDetailsUsecase;
  final RemoveMovieReviewUsecase _removeMovieReviewUsecase;
  final String movieId;

  MovieDetailNotifier(
    this._getMovieDetailsUsecase,
    this._removeMovieReviewUsecase,
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
      await Future.delayed(const Duration(seconds: 1));
      state = AppState.success(movieDetails);
    } on Exception catch (e) {
      state = AppState.error(e);
    }
  }

  Future<void> addNewReview(MovieReviewEntity newReview) async {
    try {
      state.data!.movieReviews.add(newReview);
      await Future.delayed(const Duration(seconds: 1));
      state = AppState.success(state.data!);
    } on Exception catch (e) {
      state = AppState.error(e);
    }
  }

  Future<void> deleteMovieReview(String reviewId) async {
    try {
      await _removeMovieReviewUsecase(reviewId: reviewId);
      state.data!.movieReviews.removeWhere((element) => element.id == reviewId);
      await Future.delayed(const Duration(seconds: 1));
      state = AppState.success(state.data!);
    } on Exception catch (e) {
      state = AppState.error(e);
    }
  }

  bool checkReview(MovieReviewEntity movie) {
    if (movie.user.id == '5f1e6707-7c3a-4acd-b11f-fd96096abd5a') {
      return true;
    }
    return false;
  }

  @override
  void dispose() {
    if (!mounted) {
      super.dispose();
    }
  }
}
