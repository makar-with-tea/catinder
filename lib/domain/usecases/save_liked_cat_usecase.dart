import '../entity/cat.dart';
import '../repositories/local_repository.dart';

class SaveLikedCatUseCase {
  final LocalRepository repository;

  SaveLikedCatUseCase(this.repository);

  Future<void> execute(LikedCat cat) async {
    await repository.saveLikedCat(cat);
  }
}
