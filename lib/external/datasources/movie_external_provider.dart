import 'package:coolmovies/external/proxies/api_proxy_providers.dart';
import 'package:coolmovies/infra/datasources/movie_external_datasource.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:coolmovies/external/datasources/movie_external_datasource.dart';

final movieExternalProvider = Provider<IMovieExternalDatasource>(
  (ref) {
    return MovieExternalDatasource(apiProxy: ref.read(apiProxyProvider));
  },
);
