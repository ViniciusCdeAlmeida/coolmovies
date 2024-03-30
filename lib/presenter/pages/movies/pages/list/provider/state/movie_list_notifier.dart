import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../../domain/entities/movie_list_entity.dart';
import '../../../../../../../domain/usecases/get_movie_list_usecase.dart';
import '../../../../../../state/state.dart';

class MovieListNotifier extends StateNotifier<State<MovieListEntity>> {
  final GetMovieListUsecase _getMovieListUsecase;

  MovieListNotifier(
    this._getMovieListUsecase,
  ) : super(
          const State.init(),
        );

  Future getMovieList() async {
    try {
      state = const State.loading();
      final movieList = await _getMovieListUsecase();
      state = State.success(movieList);
    } on Exception catch (e) {
      state = State.error(e);
    }
  }
}
