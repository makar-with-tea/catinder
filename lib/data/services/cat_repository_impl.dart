import 'package:catinder/data/models/cat_model.dart';
import 'package:catinder/domain/repositories/cat_repository.dart';

import '../../domain/entity/cat.dart';
import 'cat_api_client.dart';

class CatRepositoryImpl implements CatRepository {
  final CatApiClient apiClient;
  List<String>? breeds;

  CatRepositoryImpl({required this.apiClient});

  Future<List<String>> _fetchBreeds() async {
    final data = await apiClient.fetchBreeds();
    return data.map((e) => e['id'] as String).toList();
  }

  @override
  Future<List<Cat>> fetchCats({int limit = 1}) async {
    final breeds = this.breeds ?? await _fetchBreeds();
    final breedsQuery = breeds.join(',');

    final data = await apiClient.fetchCats(breedsQuery, limit);

    return data.map((catJson) {
      final catModel = CatModel.fromJson(catJson);
      return catModel.toDomain();
    }).toList();
  }
}
