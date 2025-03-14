import 'package:flutter/foundation.dart';

import 'logger.dart';

class ErrorHandler {
  static void init() {
    FlutterError.onError = _recordFlutterError;
    PlatformDispatcher.instance.onError = (error, stack) {
      recordError(error, stack);
      return true;
    };
    logger.info('ErrorHandler initialized');
  }

  static void recordError(Object error, StackTrace stackTrace) =>
      logger.severe(error.toString(), error, stackTrace);

  static void _recordFlutterError(FlutterErrorDetails error) =>
      logger.severe(error.toStringShort(), error.exception, error.stack);

  const ErrorHandler._();
}
