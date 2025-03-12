import 'dart:convert';

import 'package:catinder/models/cat_model.dart';
import 'package:catinder/tools/logger.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import '../models/breed_model.dart';

class CatService {
  List<String>? breeds;

  Future<void> fetchBreeds() async {
    final storage = FlutterSecureStorage();
    String? apiKey = await storage.read(key: 'API_KEY');
    final String apiUrl = 'https://api.thecatapi.com/v1/breeds?api_key=$apiKey';
    var response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      breeds = data.map((e) => e['id'] as String).toList();
      logger.info('Breeds: $breeds');
    } else {
      logger.severe('Failed to fetch breeds');
    }
  }

  Future<List<CatModel>> fetchCats({int limit = 1}) async {
    final storage = FlutterSecureStorage();
    String? apiKey = await storage.read(key: 'API_KEY');

    if (breeds == null) {
      await fetchBreeds();
    }

    final breedsQuery = breeds?.join(',');

    final String apiUrl =
        'https://api.thecatapi.com/v1/images/search?has_breeds=1&api_key=$apiKey&limit=$limit&breed_ids=$breedsQuery';
    logger.info('API URL: $apiUrl');

    var response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      final List<CatModel> res = [];
      for (var catJson in data) {
        final cat = CatModel(
          url: catJson['url'],
          breeds:
              (catJson['breeds'] as List<dynamic>)
                  .map((e) => BreedModel.fromJson(e as Map<String, dynamic>))
                  .toList(),
        );
        res.add(cat);
        logger.info('Cat data: $catJson');
      }
      return res;
    } else {
      logger.severe('Failed to fetch cats');
      return [];
    }
  }
}
