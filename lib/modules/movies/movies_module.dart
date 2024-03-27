import 'package:coolmovies/presenter/pages/movies/pages/detail/movie_detail_page.dart';
import 'package:coolmovies/presenter/pages/movies/pages/list/movies_list_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MoviesModule extends Module {
  // @override
  // List<Bind> get binds => [
  //       Bind<IMovieExternalDatasource>(
  //         (i) => MovieExternalDatasource(
  //           ApiProxy: i.get(),
  //         ),
  //       ),
  //       Bind<IMovieRepository>(
  //         (i) => MovieRepository(
  //           movieExternalDatasource: i.get(),
  //         ),
  //       ),
  //       Bind<MoviesListState>(
  //         (i) => MoviesListState(
  //           getMoviesListUsecase: i.get(),
  //         ),
  //       ),
  //       Bind<GetMoviesListUsecase>(
  //         (i) => GetMoviesListUsecase(
  //           movieRepository: i.get(),
  //         ),
  //       ),
  //       Bind<MovieDetailsState>(
  //         (i) => MovieDetailsState(
  //           GetMovieDetailsUsecase: i.get(),
  //           movie: i.args.data['movie'],
  //         ),
  //       ),
  //       Bind<GetMovieDetailsUsecase>(
  //         (i) => GetMovieDetailsUsecase(
  //           movieRepository: i.get(),
  //         ),
  //       ),
  //       Bind<DeleteMovieReviewUsecase>(
  //         (i) => DeleteMovieReviewUsecase(
  //           movieRepository: i.get(),
  //         ),
  //       ),
  //       Bind<CreateMovieReviewUsecase>(
  //         (i) => DeleteMovieReviewUsecase(
  //           movieRepository: i.get(),
  //         ),
  //       ),
  //     ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const MoviesListPage(),
        ),
        ChildRoute(
          '/details/',
          child: (context, args) => const MovieDetailPage(),
        ),
      ];
}
