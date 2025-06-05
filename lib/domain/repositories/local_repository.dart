import '../entity/cat.dart';

abstract class LocalRepository {
  Future<List<LikedCat>> getLikedCats();
  Future<void> saveLikedCat(LikedCat cat);
  Future<void> deleteLikedCat(String id);
}
