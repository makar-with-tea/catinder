import 'package:catinder/models/breed_model.dart';

class CatModel {
  final String? id;
  final String? url;
  final List<BreedModel>? breeds;

  CatModel({this.id, this.url, this.breeds});

  @override
  String toString() {
    return 'kitty ${breeds?[0].name}';
  }

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
}
