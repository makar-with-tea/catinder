import 'package:catinder/tools/error_handler.dart';
import 'package:catinder/tools/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'main_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initLogger();
  logger.info('Start main');
  ErrorHandler.init();

  final storage = FlutterSecureStorage();
  await storage.write(
    key: 'API_KEY',
    value:
        'live_xrkfF9cSraP6Exnx9i1KB6zavR3BGmllxQ3z3eW02cqNZO6tuz4MmZZFUR4qLVMS',
  );

  runApp(MainApp());
}
