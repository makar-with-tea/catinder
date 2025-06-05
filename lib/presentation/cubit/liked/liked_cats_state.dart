import '../../../domain/entity/cat.dart';

abstract class LikedCatsState {}

class LikedCatsLoading extends LikedCatsState {}

class LikedCatsMain extends LikedCatsState {
  final List<LikedCat> likedCats;
  final String? selectedBreed;

  LikedCatsMain(this.likedCats, this.selectedBreed);
}

class LikedCatsError extends LikedCatsState {}
