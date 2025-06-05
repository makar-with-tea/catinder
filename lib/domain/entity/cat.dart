import 'breed.dart';

class Cat {
  final String? id;
  final String? url;
  final List<Breed>? breeds;

  Cat({this.id, this.url, this.breeds});

  @override
  String toString() {
    return 'Cat{id: $id, url: $url, breeds: ${breeds?[0].name}}';
  }
}

class LikedCat extends Cat {
  final DateTime dateTime;

  LikedCat({super.id, super.url, super.breeds, required this.dateTime});

  LikedCat.fromCat(Cat cat, this.dateTime)
    : super(id: cat.id, url: cat.url, breeds: cat.breeds);
}
