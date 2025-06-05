import 'package:catinder/domain/entity/breed.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:catinder/presentation/cubit/home/home_cubit.dart';
import 'package:catinder/presentation/cubit/home/home_state.dart';
import 'package:catinder/domain/entity/cat.dart';

import '../../../main.mocks.dart';

void main() {
  final MockFetchCatsUseCase mockFetchCatsUseCase = MockFetchCatsUseCase();
  final MockSaveLikedCatUseCase mockSaveLikedCatUseCase =
      MockSaveLikedCatUseCase();
  late HomeCubit cubit;
  List<Cat> cats = [
    Cat(id: '1', url: 'url', breeds: [Breed(name: 'Breed1', id: '1')]),
    Cat(id: '2', url: 'url2', breeds: [Breed(name: 'Breed2', id: '2')]),
  ];
  when(
    mockFetchCatsUseCase.execute(limit: anyNamed('limit')),
  ).thenAnswer((_) async => cats);
  when(mockSaveLikedCatUseCase.execute(any)).thenAnswer((_) async => cats);

  setUp(() {
    cubit = HomeCubit(mockFetchCatsUseCase, mockSaveLikedCatUseCase);
    cats = [
      Cat(id: '1', url: 'url', breeds: [Breed(name: 'Breed1', id: '1')]),
      Cat(id: '2', url: 'url2', breeds: [Breed(name: 'Breed2', id: '2')]),
    ];
  });

  test('should initialize with loading state', () async {
    expect(cubit.state, isA<HomeLoading>());
  });

  test('should load cats on initState', () async {
    cubit.initState();

    expect(cubit.state, isA<HomeLoading>());
    verify(mockFetchCatsUseCase.execute(limit: 7)).called(1);
  });

  test('should emit HomeMain when cats are fetched successfully', () async {
    await cubit.loadCats(limit: 2);

    expect(cubit.state, isA<HomeMain>());
    final state = cubit.state as HomeMain;
    expect(state.cats, cats);
    verify(mockFetchCatsUseCase.execute(limit: 2)).called(1);
  });

  test('should update current cats if is already in main state', () async {
    final initialCats = [
      Cat(id: '3', url: 'url3', breeds: [Breed(name: 'Breed3', id: '3')]),
    ];
    cubit.emit(HomeMain(initialCats));

    await cubit.loadCats(limit: 2);

    expect(cubit.state, isA<HomeMain>());
    final state = cubit.state as HomeMain;
    expect(state.cats, [...cats, ...initialCats]);
  });

  test('should emit HomeError when fetching cats fails', () async {
    when(
      mockFetchCatsUseCase.execute(limit: 3),
    ).thenThrow(Exception('Liked cats error'));

    await cubit.loadCats(limit: 3);

    expect(cubit.state, isA<HomeError>());
    verify(mockFetchCatsUseCase.execute(limit: 3)).called(1);
  });

  test('should save liked cat and update state', () async {
    cubit.emit(HomeMain(cats));

    final cat = Cat(id: '1', url: 'url', breeds: []);
    when(mockSaveLikedCatUseCase.execute(any)).thenAnswer((_) async => {});

    cubit.likeCat(cat);

    verify(mockSaveLikedCatUseCase.execute(any)).called(1);
  });

  test('should not save liked cat if not in main state', () async {
    cubit.emit(HomeLoading());

    final cat = Cat(id: '1', url: 'url', breeds: []);
    cubit.likeCat(cat);

    verifyNever(mockSaveLikedCatUseCase.execute(any));
  });

  test('should correctly handle error in saving liked cat', () async {
    cubit.emit(HomeMain(cats));

    final cat = cats.first;
    when(
      mockSaveLikedCatUseCase.execute(any),
    ).thenThrow(Exception('Save cat error'));

    cubit.likeCat(cat);

    expect(cubit.state, isA<HomeMain>());
  });

  test('should dislike cat and update state', () async {
    cubit.emit(HomeMain(cats));

    final cat = cats[0];
    cubit.dislikeCat(cat);

    final state = cubit.state as HomeMain;
    expect(state.cats, isNot(contains(cat)));
  });

  test('should not dislike cat if not in main state', () async {
    cubit.emit(HomeLoading());

    final cat = cats[0];
    cubit.dislikeCat(cat);

    expect(cubit.state, isA<HomeLoading>());
    verifyNever(mockFetchCatsUseCase.execute(limit: 3));
  });

  test('should reload cats', () async {
    cubit.reloadCats();

    verify(mockFetchCatsUseCase.execute(limit: 3)).called(1);
  });
}
