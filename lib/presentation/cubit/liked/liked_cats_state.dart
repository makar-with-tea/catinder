import '../../../domain/entity/cat.dart';

abstract class LikedCatsState {}

class LikedCatsMain extends LikedCatsState {
  final List<LikedCat> likedCats;
  final String selectedBreed;

  LikedCatsMain(this.likedCats, this.selectedBreed);
}
