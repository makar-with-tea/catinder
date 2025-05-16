import 'package:catinder/domain/entity/cat.dart';
import 'breed_model.dart';

class CatModel {
  final String? id;
  final String? url;
  final List<BreedModel>? breeds;

  CatModel({this.id, this.url, this.breeds});

  factory CatModel.fromJson(Map<String, dynamic> json) {
    return CatModel(
      id: json['id'],
      url: json['url'],
      breeds:
          (json['breeds'] as List<dynamic>?)
              ?.map((e) => BreedModel.fromJson(e as Map<String, dynamic>))
              .toList(),
    );
  }

  Cat toDomain() {
    return Cat(
      id: id,
      url: url,
      breeds: breeds?.map((breedModel) => breedModel.toBreed()).toList(),
    );
  }
}
