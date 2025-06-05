import '../../domain/entity/cat.dart';
import '../../domain/repositories/local_repository.dart';
import 'local_database.dart';

class LocalRepositoryImpl implements LocalRepository {
  final LocalDatabase database;

  LocalRepositoryImpl(this.database);

  @override
  Future<List<LikedCat>> getLikedCats() async {
    final likedCats = await database.getAllLikedCats();
    return likedCats.map((cat) {
      return LikedCat(
        id: cat.id,
        url: cat.url,
        breeds: cat.breeds,
        dateTime: cat.dateTime,
      );
    }).toList();
  }

  @override
  Future<void> saveLikedCat(LikedCat cat) async {
    await database.insertLikedCat(cat);
  }

  @override
  Future<void> deleteLikedCat(String id) async {
    await database.deleteLikedCat(id);
  }
}
