import '../../../domain/entity/cat.dart';

abstract class HomeState {}

class HomeLoading extends HomeState {}

class HomeMain extends HomeState {
  final List<Cat> cats;

  HomeMain(this.cats);
}

class HomeError extends HomeState {}
