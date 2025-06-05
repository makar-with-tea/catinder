import '../entity/cat.dart';
import '../repositories/local_repository.dart';

class GetLikedCatsUseCase {
  final LocalRepository repository;

  GetLikedCatsUseCase(this.repository);

  Future<List<LikedCat>> execute() async {
    final res = await repository.getLikedCats();
    return res;
  }
}
