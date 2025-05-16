import 'dart:convert';
import 'package:http/http.dart' as http;

class CatApiClient {
  final baseUrl = 'https://api.thecatapi.com/v1';
  final String apiKey;

  String _createQueryString(Map<String, String> params) {
    return params.entries.map((e) => '${e.key}=${e.value}').join('&');
  }

  CatApiClient({required this.apiKey});

  Future<List<dynamic>> fetchBreeds() async {
    final String apiUrl =
        '$baseUrl/breeds?${_createQueryString({if (apiKey.isNotEmpty) 'api_key': apiKey})}';
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      return json.decode(response.body) as List<dynamic>;
    } else {
      throw Exception('Failed to fetch breeds');
    }
  }

  Future<List<dynamic>> fetchCats(String? breedsQuery, int limit) async {
    final String apiUrl =
        '$baseUrl/images/search?${_createQueryString({'has_breeds': '1', if (apiKey.isNotEmpty) 'api_key': apiKey, 'limit': limit.toString(), if (breedsQuery != null) 'breed_ids': breedsQuery})}';
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      return json.decode(response.body) as List<dynamic>;
    } else {
      throw Exception('Failed to fetch cats');
    }
  }
}
