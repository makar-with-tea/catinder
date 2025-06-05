import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';

import '../../domain/entity/breed.dart';
import '../../domain/entity/cat.dart';

part 'local_database.g.dart';

@DataClassName('LikedCatEntity')
class LikedCats extends Table {
  TextColumn get id => text()();
  TextColumn get url => text().nullable()();
  DateTimeColumn get datetime => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('BreedEntity')
class Breeds extends Table {
  TextColumn get id => text()();
  TextColumn get name => text().nullable()();
  TextColumn get temperament => text().nullable()();
  TextColumn get origin => text().nullable()();
  TextColumn get description => text().nullable()();
  TextColumn get lifeSpan => text().nullable()();
  IntColumn get adaptability => integer().nullable()();
  IntColumn get affectionLevel => integer().nullable()();
  IntColumn get childFriendly => integer().nullable()();
  IntColumn get dogFriendly => integer().nullable()();
  IntColumn get energyLevel => integer().nullable()();
  IntColumn get intelligence => integer().nullable()();
  IntColumn get socialNeeds => integer().nullable()();
  IntColumn get strangerFriendly => integer().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('CatBreedEntity')
class CatBreeds extends Table {
  TextColumn get catId =>
      text().customConstraint(
        'REFERENCES liked_cats(id) ON DELETE CASCADE NOT NULL',
      )();

  TextColumn get breedId =>
      text().customConstraint(
        'REFERENCES breeds(id) ON DELETE CASCADE NOT NULL',
      )();

  @override
  Set<Column> get primaryKey => {catId, breedId};
}

@DriftDatabase(tables: [LikedCats, Breeds, CatBreeds])
class LocalDatabase extends _$LocalDatabase {
  LocalDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<List<LikedCat>> getAllLikedCats() async {
    final likedCatsList = await select(likedCats).get();
    return Future.wait(
      likedCatsList.map((cat) async {
        final breedIds =
            await (select(catBreeds)
              ..where((tbl) => tbl.catId.equals(cat.id))).get();
        final resultBreeds = await Future.wait(
          breedIds.map((cb) async {
            return await (select(breeds)
              ..where((tbl) => tbl.id.equals(cb.breedId))).getSingle();
          }),
        );
        return LikedCat(
          id: cat.id,
          url: cat.url,
          breeds: resultBreeds.map(_mapBreedEntityToBreed).toList(),
          dateTime: cat.datetime,
        );
      }),
    );
  }

  Future<void> insertLikedCat(LikedCat cat) async {
    await into(likedCats).insertOnConflictUpdate(
      LikedCatEntity(id: cat.id!, url: cat.url, datetime: cat.dateTime),
    );

    await batch((batch) {
      batch.insertAll(
        breeds,
        cat.breeds
                ?.map(
                  (breed) => BreedEntity(
                    id: breed.id!,
                    name: breed.name,
                    temperament: breed.temperament,
                    origin: breed.origin,
                    description: breed.description,
                    lifeSpan: breed.lifeSpan,
                    adaptability: breed.adaptability,
                    affectionLevel: breed.affectionLevel,
                    childFriendly: breed.childFriendly,
                    dogFriendly: breed.dogFriendly,
                    energyLevel: breed.energyLevel,
                    intelligence: breed.intelligence,
                    socialNeeds: breed.socialNeeds,
                    strangerFriendly: breed.strangerFriendly,
                  ),
                )
                .toList() ??
            [],
        mode: InsertMode.insertOrIgnore,
      );

      batch.insertAll(
        catBreeds,
        cat.breeds
                ?.map(
                  (breed) => CatBreedEntity(catId: cat.id!, breedId: breed.id!),
                )
                .toList() ??
            [],
      );
    });
  }

  Future<void> deleteLikedCat(String id) async {
    await (delete(likedCats)..where((tbl) => tbl.id.equals(id))).go();
  }

  Breed _mapBreedEntityToBreed(BreedEntity entity) {
    return Breed(
      id: entity.id,
      name: entity.name,
      temperament: entity.temperament,
      origin: entity.origin,
      description: entity.description,
      lifeSpan: entity.lifeSpan,
      adaptability: entity.adaptability,
      affectionLevel: entity.affectionLevel,
      childFriendly: entity.childFriendly,
      dogFriendly: entity.dogFriendly,
      energyLevel: entity.energyLevel,
      intelligence: entity.intelligence,
      socialNeeds: entity.socialNeeds,
      strangerFriendly: entity.strangerFriendly,
    );
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File('${dbFolder.path}/liked_cats.sqlite');
    return NativeDatabase(file);
  });
}
