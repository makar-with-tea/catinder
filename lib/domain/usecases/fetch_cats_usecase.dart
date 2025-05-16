import '../entity/cat.dart';
import '../repositories/cat_repository.dart';

class FetchCatsUseCase {
  final CatRepository repository;

  FetchCatsUseCase(this.repository);

  Future<List<Cat>> execute({int limit = 1}) async {
    return await repository.fetchCats(limit: limit);
  }
}
