import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../../domain/entities/movie_list_entity.dart';
import '../../../../../../../domain/usecases/get_movie_list_usecase.dart';
import '../../../../../../state/state.dart';

class MovieListNotifier extends StateNotifier<AppState<List<MovieListEntity>>> {
  final GetMovieListUsecase _getMovieListUsecase;

  MovieListNotifier(
    this._getMovieListUsecase,
  ) : super(
          const AppState.init(),
        ) {
    getMovieList();
  }

  Future<void> getMovieList() async {
    try {
      state = const AppState.loading();
      final movieList = await _getMovieListUsecase();
      // await Future.delayed(const Duration(seconds: 10));
      state = AppState.success(movieList);
    } on Exception catch (e) {
      state = AppState.error(e);
    }
  }
}
