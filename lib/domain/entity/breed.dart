class Breed {
  final String? weightMetric;
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

  final List<String>? tags;

  Breed({
    this.weightMetric,
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
}
