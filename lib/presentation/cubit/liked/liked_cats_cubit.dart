import 'package:catinder/domain/usecases/get_liked_cats_usecase.dart';
import 'package:catinder/tools/logger.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entity/cat.dart';
import '../../../domain/usecases/delete_liked_cat_usecase.dart';
import 'liked_cats_state.dart';

class LikedCatsCubit extends Cubit<LikedCatsState> {
  final GetLikedCatsUseCase getLikedCatsUseCase;
  final DeleteLikedCatUseCase deleteLikedCatUseCase;
  List<LikedCat> allLikedCats = [];
  List<String?> breeds = [null];

  LikedCatsCubit(this.getLikedCatsUseCase, this.deleteLikedCatUseCase)
    : super(LikedCatsLoading());

  Future<void> loadLikedCats() async {
    emit(LikedCatsLoading());
    try {
      allLikedCats = await getLikedCatsUseCase.execute();
      _initializeBreeds();
      emit(LikedCatsMain(allLikedCats, null));
    } catch (error) {
      logger.severe("load liked cats error: $error ${error.runtimeType}");
      emit(LikedCatsError());
    }
  }

  void _initializeBreeds() {
    breeds = allLikedCats.map((cat) => cat.breeds?.first.name).toSet().toList();
    breeds.sort((a, b) {
      if (a == null) return -1;
      if (b == null) return 1;
      return a.compareTo(b);
    });
    breeds.insert(0, null);
  }

  void filterByBreed(String? breed) {
    if (breed == null) {
      logger.info("filterByBreed null");
      emit(LikedCatsMain(allLikedCats, null));
    } else {
      final filteredCats =
          allLikedCats.where((cat) {
            return cat.breeds?.first.name == breed;
          }).toList();
      logger.info("filterByBreed $breed, filtered: $filteredCats");
      emit(LikedCatsMain(filteredCats, breed));
    }
  }

  Future<void> unlikeCat(LikedCat cat) async {
    if (state is! LikedCatsMain) return;
    try {
      await deleteLikedCatUseCase.execute(cat.id ?? '');
      allLikedCats.remove(cat);
      final breedToRemove = cat.breeds?.first.name;
      if (breedToRemove != null &&
          allLikedCats.every((c) => c.breeds?.first.name != breedToRemove)) {
        breeds.remove(breedToRemove);
      }
      final currentState = state as LikedCatsMain;
      if (!breeds.contains(currentState.selectedBreed)) {
        emit(LikedCatsMain(allLikedCats, null));
      } else {
        currentState.likedCats.remove(cat);
        emit(LikedCatsMain(currentState.likedCats, currentState.selectedBreed));
      }
    } catch (error) {
      emit(LikedCatsError());
    }
  }
}
