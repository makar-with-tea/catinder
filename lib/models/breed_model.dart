import 'weight_model.dart';

class BreedModel {
  final WeightModel? weight;
  final String? id;
  final String? name;
  final String? temperament;
  final String? origin;
  final String? description;
  final String? lifeSpan;
  final String? altNames;
  final String? wikipediaUrl;

  final int? adaptability;
  final int? childFriendly;
  final int? dogFriendly;
  final int? affectionLevel;
  final int? energyLevel;
  final int? intelligence;
  final int? sheddingLevel;
  final int? grooming;
  final int? healthIssues;
  final int? socialNeeds;
  final int? strangerFriendly;
  final int? vocalisation;
  // boolean tags
  final List<String>? tags;

  BreedModel({
    this.weight,
    this.id,
    this.name,
    this.temperament,
    this.origin,
    this.description,
    this.lifeSpan,
    this.altNames,
    this.adaptability,
    this.affectionLevel,
    this.childFriendly,
    this.dogFriendly,
    this.energyLevel,
    this.grooming,
    this.healthIssues,
    this.intelligence,
    this.sheddingLevel,
    this.socialNeeds,
    this.strangerFriendly,
    this.vocalisation,
    this.wikipediaUrl,
    this.tags,
  });

  factory BreedModel.fromJson(Map<String, dynamic> json) {
    List<String>? tags = [];
    if (json['indoor'] == 1) tags.add('indoor');
    if (json['lap'] == 1) tags.add('lap');
    if (json['experimental'] == 1) tags.add('experimental');
    if (json['hairless'] == 1) tags.add('hairless');
    if (json['natural'] == 1) tags.add('natural');
    if (json['rare'] == 1) tags.add('rare');
    if (json['rex'] == 1) tags.add('rex');
    if (json['suppressed_tail'] == 1) tags.add('suppressed tail');
    if (json['short_legs'] == 1) tags.add('short legs');
    if (json['hypoallergenic'] == 1) tags.add('hypoallergenic');
    if (tags.isEmpty) tags = null;

    return BreedModel(
      weight: WeightModel.fromJson(json['weight']),
      id: json['id'],
      name: json['name'],
      temperament: json['temperament'],
      origin: json['origin'],
      description: json['description'],
      lifeSpan: json['life_span'],
      altNames: json['alt_names'],
      adaptability: json['adaptability'],
      affectionLevel: json['affection_level'],
      childFriendly: json['child_friendly'],
      dogFriendly: json['dog_friendly'],
      energyLevel: json['energy_level'],
      grooming: json['grooming'],
      healthIssues: json['health_issues'],
      intelligence: json['intelligence'],
      sheddingLevel: json['shedding_level'],
      socialNeeds: json['social_needs'],
      strangerFriendly: json['stranger_friendly'],
      vocalisation: json['vocalisation'],
      wikipediaUrl: json['wikipedia_url'],
      tags: tags,
    );
  }
}
