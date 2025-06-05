import '../repositories/local_repository.dart';

class DeleteLikedCatUseCase {
  final LocalRepository repository;

  DeleteLikedCatUseCase(this.repository);

  Future<void> execute(String id) async {
    await repository.deleteLikedCat(id);
  }
}
