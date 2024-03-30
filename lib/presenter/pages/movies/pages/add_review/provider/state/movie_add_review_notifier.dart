import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../../domain/entities/movie_detail_entity.dart';
import '../../../../../../../domain/usecases/add_movie_review_usecase.dart';
import '../../../../../../state/state.dart';

class MovieAddReviewNotifier extends StateNotifier<AppState<MovieDetailEntity>> {
  final AddMovieReviewUsecase _addMovieReviewUsecase;
  final MovieDetailEntity movieDetails;

  MovieAddReviewNotifier(
    this._addMovieReviewUsecase,
    this.movieDetails,
  ) : super(
          const AppState.init(),
        );

  final formKey = GlobalKey<FormState>();
  String title = '';
  String body = '';
  int rating = 0;

  Future<void> addReviewMovie(String userId) async {
    try {
      state = const AppState.loading();
      // final movieDetails = await _addMovieReviewUsecase(id: movieID);
      await Future.delayed(const Duration(seconds: 5));
      state = AppState.success(movieDetails);
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
