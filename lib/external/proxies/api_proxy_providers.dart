import 'package:coolmovies/external/proxies/api_proxy.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final apiProxyProvider = Provider<ApiProxy>(
  (ref) {
    return ApiProxy(
      apiUrl: dotenv.env['API_URL']!,
    );
  },
);
