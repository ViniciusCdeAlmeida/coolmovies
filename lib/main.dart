import 'package:coolmovies/modules/app_module.dart';
import 'package:coolmovies/presenter/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_modular/flutter_modular.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: '.env');

  ModularApp(
    module: AppModule(),
    child: const AppWidget(),
  );
}
