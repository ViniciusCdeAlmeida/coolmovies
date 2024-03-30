import 'package:flutter_modular/flutter_modular.dart';

import '../../presenter/pages/movies/pages/detail/movie_detail_page.dart';
import '../../presenter/pages/movies/pages/list/page/movies_list_page.dart';

class MoviesModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const MoviesListPage(),
        ),
        ChildRoute(
          '/details/',
          child: (context, args) => MovieDetailPage(
            movieId: args.data['movieId'],
            title: args.data['title'],
          ),
        ),
      ];
}
