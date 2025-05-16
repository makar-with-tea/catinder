import 'package:catinder/tools/logger.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SaveApiKeyUseCase {
  final FlutterSecureStorage storage;

  SaveApiKeyUseCase(this.storage);

  Future<void> execute(String? apiKey) async {
    if (apiKey == null || apiKey.isEmpty) {
      logger.warning('API key is null or empty');
    } else {
      await storage.write(key: 'API_KEY', value: apiKey);
    }
  }
}
