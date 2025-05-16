import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class GetApiKeyUseCase {
  final FlutterSecureStorage storage;

  GetApiKeyUseCase(this.storage);

  Future<String?> execute() async {
    return await storage.read(key: 'API_KEY');
  }
}
