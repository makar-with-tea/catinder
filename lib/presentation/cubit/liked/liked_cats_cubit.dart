import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entity/cat.dart';
import '../../../generated/l10n.dart';
import 'liked_cats_state.dart';

class LikedCatsCubit extends Cubit<LikedCatsState> {
  final List<LikedCat> allLikedCats;
  List<String> breeds = [];

  LikedCatsCubit(this.allLikedCats)
    : super(LikedCatsMain(allLikedCats, S.current.allBreedsOption)) {
    _initializeBreeds();
  }

  void _initializeBreeds() {
    breeds =
        allLikedCats
            .map((cat) => cat.breeds?.first.name ?? S.current.unknownCat)
            .toSet()
            .toList();
    breeds.sort((a, b) => a.compareTo(b));
    breeds.insert(0, S.current.allBreedsOption);
  }

  void filterByBreed(String breed) {
    if (breed == S.current.allBreedsOption) {
      emit(LikedCatsMain(allLikedCats, S.current.allBreedsOption));
    } else {
      final filteredCats =
          allLikedCats.where((cat) {
            return cat.breeds?.first.name == breed;
          }).toList();
      emit(LikedCatsMain(filteredCats, breed));
    }
  }

  void unlikeCat(Cat cat) {
    allLikedCats.remove(cat);
    final breedToRemove = cat.breeds?.first.name;
    if (breedToRemove != null &&
        allLikedCats.every((c) => c.breeds?.first.name != breedToRemove)) {
      breeds.remove(breedToRemove);
    }
    final currentState = state as LikedCatsMain;
    if (!breeds.contains(currentState.selectedBreed)) {
      emit(LikedCatsMain(allLikedCats, S.current.allBreedsOption));
    } else {
      currentState.likedCats.remove(cat);
      emit(LikedCatsMain(currentState.likedCats, currentState.selectedBreed));
    }
  }
}
