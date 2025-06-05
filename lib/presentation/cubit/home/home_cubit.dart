import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entity/cat.dart';
import '../../../domain/usecases/fetch_cats_usecase.dart';
import '../../../domain/usecases/save_liked_cat_usecase.dart';
import '../../../tools/error_handler.dart';
import '../../../tools/logger.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final FetchCatsUseCase fetchCatsUseCase;
  final SaveLikedCatUseCase saveLikedCatUseCase;

  HomeCubit(this.fetchCatsUseCase, this.saveLikedCatUseCase)
    : super(HomeLoading());

  void initState() {
    // for testing purposes moved from constructor
    loadCats(limit: 7);
  }

  Future<void> loadCats({int limit = 1}) async {
    List<Cat> updatedCats = [];
    if (state is HomeMain) {
      updatedCats = (state as HomeMain).cats;
    }
    try {
      List<Cat> catList = await fetchCatsUseCase.execute(limit: limit);
      final currentState = state;
      if (currentState is HomeMain) {
        updatedCats = List.of(currentState.cats)..insertAll(0, catList);
        logger.info('Updated cats: $catList');
      } else {
        updatedCats = catList;
        logger.info('Initial cats: $catList');
      }
    } catch (error, stackTrace) {
      ErrorHandler.recordError(error, stackTrace);
    }
    if (updatedCats.isNotEmpty) {
      emit(HomeMain(updatedCats));
    } else {
      emit(HomeError());
    }
  }

  void likeCat(Cat cat) async {
    if (state is! HomeMain) {
      logger.warning('Cannot like cat in non-HomeMain state');
      return;
    }
    try {
      await saveLikedCatUseCase.execute(LikedCat.fromCat(cat, DateTime.now()));
      final updatedCats = (state as HomeMain).cats..removeLast();
      logger.info('Like cat, cats: $updatedCats');
      emit(HomeMain(updatedCats));
      loadCats();
    } catch (error, stackTrace) {
      ErrorHandler.recordError(error, stackTrace);
    }
  }

  void dislikeCat(Cat cat) {
    if (state is! HomeMain) {
      logger.warning('Cannot dislike cat in non-HomeMain state');
      return;
    }
    final updatedCats = (state as HomeMain).cats..remove(cat);
    logger.info('Dislike cat, cats: $updatedCats');
    emit(HomeMain(updatedCats));
    loadCats();
  }

  void reloadCats() {
    emit(HomeLoading());
    loadCats(limit: 3);
  }
}
