import '../external/proxies/api_proxy.dart';
import 'movies/movies_module.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  AppModule();

  @override
  List<Bind> get binds {
    return [
      Bind.singleton<ApiProxy>(
        (i) => ApiProxy(
          apiUrl: dotenv.env['API_URL']!,
        ),
      ),
    ];
  }

  @override
  List<ModularRoute> get routes {
    return [
      ModuleRoute(
        '/',
        module: MoviesModule(),
      ),
    ];
  }
}
