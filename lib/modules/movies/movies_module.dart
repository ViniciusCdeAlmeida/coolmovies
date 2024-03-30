import '../../domain/repositories/movie_repository.dart';
import '../../external/datasources/movie_external_datasource.dart';
import '../../infra/datasources/movie_external_datasource.dart';
import '../../infra/repositories/movie_repository.dart';
import '../../presenter/pages/movies/pages/detail/movie_detail_page.dart';
import '../../presenter/pages/movies/pages/list/page/movies_list_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MoviesModule extends Module {
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
