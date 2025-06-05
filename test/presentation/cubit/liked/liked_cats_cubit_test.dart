import 'package:catinder/domain/entity/breed.dart';
import 'package:catinder/domain/entity/cat.dart';
import 'package:catinder/presentation/cubit/liked/liked_cats_cubit.dart';
import 'package:catinder/presentation/cubit/liked/liked_cats_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../main.mocks.dart';

void main() async {
  late MockGetLikedCatsUseCase mockGetLikedCatsUseCase;
  late MockDeleteLikedCatUseCase mockDeleteLikedCatUseCase;
  late LikedCatsCubit cubit;
  late List<LikedCat> likedCats;

  setUp(() {
    mockGetLikedCatsUseCase = MockGetLikedCatsUseCase();
    mockDeleteLikedCatUseCase = MockDeleteLikedCatUseCase();
    cubit = LikedCatsCubit(mockGetLikedCatsUseCase, mockDeleteLikedCatUseCase);

    likedCats = [
      LikedCat(
        id: '1',
        url: 'url1',
        breeds: [Breed(name: 'Breed1', id: '1')],
        dateTime: DateTime.now(),
      ),
      LikedCat(
        id: '2',
        url: 'url2',
        breeds: [Breed(name: 'Breed2', id: '2')],
        dateTime: DateTime.now(),
      ),
    ];
  });

  test(
    'should emit LikedCatsMain when liked cats are loaded successfully',
    () async {
      when(
        mockGetLikedCatsUseCase.execute(),
      ).thenAnswer((_) async => likedCats);

      await cubit.loadLikedCats();

      expect(cubit.state, isA<LikedCatsMain>());
      final state = cubit.state as LikedCatsMain;
      expect(state.likedCats, likedCats);
      verify(mockGetLikedCatsUseCase.execute()).called(1);
    },
  );

  test('should emit LikedCatsError when loading liked cats fails', () async {
    when(mockGetLikedCatsUseCase.execute()).thenThrow(Exception());

    await cubit.loadLikedCats();

    expect(cubit.state, isA<LikedCatsError>());
    verify(mockGetLikedCatsUseCase.execute()).called(1);
  });

  test('should filter liked cats by breed', () async {
    cubit.allLikedCats = likedCats;
    cubit.filterByBreed('Breed1');

    expect(cubit.state, isA<LikedCatsMain>());
    final state = cubit.state as LikedCatsMain;
    expect(state.likedCats, [likedCats[0]]);
    expect(state.selectedBreed, 'Breed1');
  });

  test('should reset filter when selecting all breeds', () async {
    cubit.allLikedCats = likedCats;
    cubit.filterByBreed('Breed1');
    cubit.filterByBreed(null);

    expect(cubit.state, isA<LikedCatsMain>());
    final state = cubit.state as LikedCatsMain;
    expect(state.likedCats, likedCats);
    expect(state.selectedBreed, null);
  });

  test('should remove liked cat and update state', () async {
    cubit.allLikedCats = [likedCats[0], likedCats[1]];
    cubit.emit(LikedCatsMain(cubit.allLikedCats, null));
    when(
      mockDeleteLikedCatUseCase.execute(likedCats[0].id!),
    ).thenAnswer((_) async => {});

    await cubit.unlikeCat(likedCats[0]);

    expect(cubit.allLikedCats, [likedCats[1]]);
    verify(mockDeleteLikedCatUseCase.execute(likedCats[0].id!)).called(1);
  });

  test('should not remove liked cat from state other than main', () async {
    cubit.allLikedCats = likedCats;
    when(
      mockDeleteLikedCatUseCase.execute(likedCats[0].id!),
    ).thenAnswer((_) async => {});

    await cubit.unlikeCat(likedCats[0]);

    verifyZeroInteractions(mockGetLikedCatsUseCase);
  });

  test(
    'should set current breed to null if the last cat with this breed was deleted',
    () async {
      cubit.allLikedCats = [likedCats[0], likedCats[1]];
      cubit.emit(LikedCatsMain(cubit.allLikedCats, 'Breed1'));
      when(
        mockDeleteLikedCatUseCase.execute(likedCats[0].id!),
      ).thenAnswer((_) async => {});

      await cubit.unlikeCat(likedCats[0]);

      expect(cubit.state, isA<LikedCatsMain>());
      final state = cubit.state as LikedCatsMain;
      expect(state.likedCats, [likedCats[1]]);
      expect(state.selectedBreed, null);
    },
  );

  test(
    'should leave the breed of removed cat if there are other cats with this breed',
    () async {
      LikedCat newCat = LikedCat(
        id: '3',
        url: 'url3',
        breeds: [Breed(name: 'Breed1', id: '1')],
        dateTime: DateTime.now(),
      );
      when(
        mockGetLikedCatsUseCase.execute(),
      ).thenAnswer((_) async => [likedCats[0], likedCats[1], newCat]);
      when(
        mockDeleteLikedCatUseCase.execute(likedCats[0].id!),
      ).thenAnswer((_) async => {});

      await cubit.loadLikedCats();
      cubit.filterByBreed('Breed1');

      await cubit.unlikeCat(likedCats[0]);

      expect(cubit.state, isA<LikedCatsMain>());
      final state = cubit.state as LikedCatsMain;
      expect(state.likedCats, [newCat]);
      expect(state.selectedBreed, 'Breed1');
    },
  );

  test('should emit LikedCatsError when unliking a cat fails', () async {
    cubit.allLikedCats = likedCats;
    cubit.emit(LikedCatsMain(cubit.allLikedCats, null));
    when(
      mockDeleteLikedCatUseCase.execute(likedCats[0].id!),
    ).thenThrow(Exception());

    await cubit.unlikeCat(likedCats[0]);

    expect(cubit.state, isA<LikedCatsError>());
    verify(mockDeleteLikedCatUseCase.execute(likedCats[0].id!)).called(1);
  });
}
