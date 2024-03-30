import 'package:coolmovies/domain/entities/movie_review_entity.dart';
import 'package:coolmovies/presenter/pages/movies/pages/detail/provider/state/movie_detail_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../../domain/entities/movie_detail_entity.dart';
import '../../../../../../../domain/usecases/add_movie_review_usecase.dart';
import '../../../../../../state/state.dart';

class MovieAddReviewNotifier extends StateNotifier<AppState<MovieReviewEntity>> {
  final AddMovieReviewUsecase _addMovieReviewUsecase;
  final MovieDetailEntity movieDetails;
  final MovieDetailNotifier _movieDetailNotifier;

  MovieAddReviewNotifier(
    this._addMovieReviewUsecase,
    this.movieDetails,
    this._movieDetailNotifier,
  ) : super(
          const AppState.init(),
        );

  final formKey = GlobalKey<FormState>();
  String title = '';
  String body = '';
  int rating = 0;

  Future<void> addReviewMovie(String movieId) async {
    try {
      state = const AppState.loading();
      final movieReview = await _addMovieReviewUsecase(
        title: title,
        movieId: movieId,
        body: body,
        rating: rating,
        userId: '5f1e6707-7c3a-4acd-b11f-fd96096abd5a',
      );
      _movieDetailNotifier.addNewReview(movieReview);
      await Future.delayed(const Duration(seconds: 1));
      state = AppState.success(movieReview);
      Modular.to.pop();
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
