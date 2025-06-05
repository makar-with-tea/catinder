import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'domain/usecases/save_api_key_usecase.dart';
import 'presentation/main_app.dart';
import 'presentation/di/di.dart';
import 'tools/error_handler.dart';
import 'tools/logger.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initLogger();
  logger.info('Start main');
  ErrorHandler.init();

  await dotenv.load();
  setupDependencies();
  await getIt.allReady();

  final saveApiKeyUseCase = getIt<SaveApiKeyUseCase>();
  if (dotenv.env['API_KEY'] == null) {
    logger.warning('API_KEY is not set in .env file');
  } else {
    logger.info('API_KEY is set in .env file');
  }
  await saveApiKeyUseCase.execute(dotenv.env['API_KEY'] ?? '');

  runApp(MainAppWrapper());
}
