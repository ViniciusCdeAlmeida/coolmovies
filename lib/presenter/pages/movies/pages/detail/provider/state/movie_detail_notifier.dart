import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../../domain/entities/movie_detail_entity.dart';
import '../../../../../../../domain/usecases/get_movie_details_usecase.dart';
import '../../../../../../state/state.dart';

class MovieDetailNotifier extends StateNotifier<AppState<MovieDetailEntity>> {
  final GetMovieDetailsUsecase _getMovieDetailsUsecase;
  final String movieID;

  MovieDetailNotifier(
    this._getMovieDetailsUsecase,
    this.movieID,
  ) : super(
          const AppState.init(),
        ) {
    getMovieDetails(movieID);
  }

  Future<void> getMovieDetails(String movieID) async {
    try {
      state = const AppState.loading();
      final movieDetails = await _getMovieDetailsUsecase(id: movieID);
      // await Future.delayed(const Duration(seconds: 10));
      state = AppState.success(movieDetails);
    } on Exception catch (e) {
      state = AppState.error(e);
    }
  }
}
