// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_database.dart';

// ignore_for_file: type=lint
class $LikedCatsTable extends LikedCats
    with TableInfo<$LikedCatsTable, LikedCatEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LikedCatsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedColumn<String> url = GeneratedColumn<String>(
    'url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _datetimeMeta = const VerificationMeta(
    'datetime',
  );
  @override
  late final GeneratedColumn<DateTime> datetime = GeneratedColumn<DateTime>(
    'datetime',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, url, datetime];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'liked_cats';
  @override
  VerificationContext validateIntegrity(
    Insertable<LikedCatEntity> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('url')) {
      context.handle(
        _urlMeta,
        url.isAcceptableOrUnknown(data['url']!, _urlMeta),
      );
    }
    if (data.containsKey('datetime')) {
      context.handle(
        _datetimeMeta,
        datetime.isAcceptableOrUnknown(data['datetime']!, _datetimeMeta),
      );
    } else if (isInserting) {
      context.missing(_datetimeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LikedCatEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LikedCatEntity(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}id'],
          )!,
      url: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}url'],
      ),
      datetime:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}datetime'],
          )!,
    );
  }

  @override
  $LikedCatsTable createAlias(String alias) {
    return $LikedCatsTable(attachedDatabase, alias);
  }
}

class LikedCatEntity extends DataClass implements Insertable<LikedCatEntity> {
  final String id;
  final String? url;
  final DateTime datetime;
  const LikedCatEntity({required this.id, this.url, required this.datetime});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || url != null) {
      map['url'] = Variable<String>(url);
    }
    map['datetime'] = Variable<DateTime>(datetime);
    return map;
  }

  LikedCatsCompanion toCompanion(bool nullToAbsent) {
    return LikedCatsCompanion(
      id: Value(id),
      url: url == null && nullToAbsent ? const Value.absent() : Value(url),
      datetime: Value(datetime),
    );
  }

  factory LikedCatEntity.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LikedCatEntity(
      id: serializer.fromJson<String>(json['id']),
      url: serializer.fromJson<String?>(json['url']),
      datetime: serializer.fromJson<DateTime>(json['datetime']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'url': serializer.toJson<String?>(url),
      'datetime': serializer.toJson<DateTime>(datetime),
    };
  }

  LikedCatEntity copyWith({
    String? id,
    Value<String?> url = const Value.absent(),
    DateTime? datetime,
  }) => LikedCatEntity(
    id: id ?? this.id,
    url: url.present ? url.value : this.url,
    datetime: datetime ?? this.datetime,
  );
  LikedCatEntity copyWithCompanion(LikedCatsCompanion data) {
    return LikedCatEntity(
      id: data.id.present ? data.id.value : this.id,
      url: data.url.present ? data.url.value : this.url,
      datetime: data.datetime.present ? data.datetime.value : this.datetime,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LikedCatEntity(')
          ..write('id: $id, ')
          ..write('url: $url, ')
          ..write('datetime: $datetime')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, url, datetime);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LikedCatEntity &&
          other.id == this.id &&
          other.url == this.url &&
          other.datetime == this.datetime);
}

class LikedCatsCompanion extends UpdateCompanion<LikedCatEntity> {
  final Value<String> id;
  final Value<String?> url;
  final Value<DateTime> datetime;
  final Value<int> rowid;
  const LikedCatsCompanion({
    this.id = const Value.absent(),
    this.url = const Value.absent(),
    this.datetime = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LikedCatsCompanion.insert({
    required String id,
    this.url = const Value.absent(),
    required DateTime datetime,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       datetime = Value(datetime);
  static Insertable<LikedCatEntity> custom({
    Expression<String>? id,
    Expression<String>? url,
    Expression<DateTime>? datetime,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (url != null) 'url': url,
      if (datetime != null) 'datetime': datetime,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LikedCatsCompanion copyWith({
    Value<String>? id,
    Value<String?>? url,
    Value<DateTime>? datetime,
    Value<int>? rowid,
  }) {
    return LikedCatsCompanion(
      id: id ?? this.id,
      url: url ?? this.url,
      datetime: datetime ?? this.datetime,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (datetime.present) {
      map['datetime'] = Variable<DateTime>(datetime.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LikedCatsCompanion(')
          ..write('id: $id, ')
          ..write('url: $url, ')
          ..write('datetime: $datetime, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $BreedsTable extends Breeds with TableInfo<$BreedsTable, BreedEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BreedsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _temperamentMeta = const VerificationMeta(
    'temperament',
  );
  @override
  late final GeneratedColumn<String> temperament = GeneratedColumn<String>(
    'temperament',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _originMeta = const VerificationMeta('origin');
  @override
  late final GeneratedColumn<String> origin = GeneratedColumn<String>(
    'origin',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _lifeSpanMeta = const VerificationMeta(
    'lifeSpan',
  );
  @override
  late final GeneratedColumn<String> lifeSpan = GeneratedColumn<String>(
    'life_span',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _adaptabilityMeta = const VerificationMeta(
    'adaptability',
  );
  @override
  late final GeneratedColumn<int> adaptability = GeneratedColumn<int>(
    'adaptability',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _affectionLevelMeta = const VerificationMeta(
    'affectionLevel',
  );
  @override
  late final GeneratedColumn<int> affectionLevel = GeneratedColumn<int>(
    'affection_level',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _childFriendlyMeta = const VerificationMeta(
    'childFriendly',
  );
  @override
  late final GeneratedColumn<int> childFriendly = GeneratedColumn<int>(
    'child_friendly',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _dogFriendlyMeta = const VerificationMeta(
    'dogFriendly',
  );
  @override
  late final GeneratedColumn<int> dogFriendly = GeneratedColumn<int>(
    'dog_friendly',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _energyLevelMeta = const VerificationMeta(
    'energyLevel',
  );
  @override
  late final GeneratedColumn<int> energyLevel = GeneratedColumn<int>(
    'energy_level',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _intelligenceMeta = const VerificationMeta(
    'intelligence',
  );
  @override
  late final GeneratedColumn<int> intelligence = GeneratedColumn<int>(
    'intelligence',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _socialNeedsMeta = const VerificationMeta(
    'socialNeeds',
  );
  @override
  late final GeneratedColumn<int> socialNeeds = GeneratedColumn<int>(
    'social_needs',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _strangerFriendlyMeta = const VerificationMeta(
    'strangerFriendly',
  );
  @override
  late final GeneratedColumn<int> strangerFriendly = GeneratedColumn<int>(
    'stranger_friendly',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    temperament,
    origin,
    description,
    lifeSpan,
    adaptability,
    affectionLevel,
    childFriendly,
    dogFriendly,
    energyLevel,
    intelligence,
    socialNeeds,
    strangerFriendly,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'breeds';
  @override
  VerificationContext validateIntegrity(
    Insertable<BreedEntity> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    }
    if (data.containsKey('temperament')) {
      context.handle(
        _temperamentMeta,
        temperament.isAcceptableOrUnknown(
          data['temperament']!,
          _temperamentMeta,
        ),
      );
    }
    if (data.containsKey('origin')) {
      context.handle(
        _originMeta,
        origin.isAcceptableOrUnknown(data['origin']!, _originMeta),
      );
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('life_span')) {
      context.handle(
        _lifeSpanMeta,
        lifeSpan.isAcceptableOrUnknown(data['life_span']!, _lifeSpanMeta),
      );
    }
    if (data.containsKey('adaptability')) {
      context.handle(
        _adaptabilityMeta,
        adaptability.isAcceptableOrUnknown(
          data['adaptability']!,
          _adaptabilityMeta,
        ),
      );
    }
    if (data.containsKey('affection_level')) {
      context.handle(
        _affectionLevelMeta,
        affectionLevel.isAcceptableOrUnknown(
          data['affection_level']!,
          _affectionLevelMeta,
        ),
      );
    }
    if (data.containsKey('child_friendly')) {
      context.handle(
        _childFriendlyMeta,
        childFriendly.isAcceptableOrUnknown(
          data['child_friendly']!,
          _childFriendlyMeta,
        ),
      );
    }
    if (data.containsKey('dog_friendly')) {
      context.handle(
        _dogFriendlyMeta,
        dogFriendly.isAcceptableOrUnknown(
          data['dog_friendly']!,
          _dogFriendlyMeta,
        ),
      );
    }
    if (data.containsKey('energy_level')) {
      context.handle(
        _energyLevelMeta,
        energyLevel.isAcceptableOrUnknown(
          data['energy_level']!,
          _energyLevelMeta,
        ),
      );
    }
    if (data.containsKey('intelligence')) {
      context.handle(
        _intelligenceMeta,
        intelligence.isAcceptableOrUnknown(
          data['intelligence']!,
          _intelligenceMeta,
        ),
      );
    }
    if (data.containsKey('social_needs')) {
      context.handle(
        _socialNeedsMeta,
        socialNeeds.isAcceptableOrUnknown(
          data['social_needs']!,
          _socialNeedsMeta,
        ),
      );
    }
    if (data.containsKey('stranger_friendly')) {
      context.handle(
        _strangerFriendlyMeta,
        strangerFriendly.isAcceptableOrUnknown(
          data['stranger_friendly']!,
          _strangerFriendlyMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BreedEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BreedEntity(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}id'],
          )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      ),
      temperament: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}temperament'],
      ),
      origin: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}origin'],
      ),
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      lifeSpan: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}life_span'],
      ),
      adaptability: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}adaptability'],
      ),
      affectionLevel: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}affection_level'],
      ),
      childFriendly: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}child_friendly'],
      ),
      dogFriendly: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}dog_friendly'],
      ),
      energyLevel: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}energy_level'],
      ),
      intelligence: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}intelligence'],
      ),
      socialNeeds: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}social_needs'],
      ),
      strangerFriendly: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}stranger_friendly'],
      ),
    );
  }

  @override
  $BreedsTable createAlias(String alias) {
    return $BreedsTable(attachedDatabase, alias);
  }
}

class BreedEntity extends DataClass implements Insertable<BreedEntity> {
  final String id;
  final String? name;
  final String? temperament;
  final String? origin;
  final String? description;
  final String? lifeSpan;
  final int? adaptability;
  final int? affectionLevel;
  final int? childFriendly;
  final int? dogFriendly;
  final int? energyLevel;
  final int? intelligence;
  final int? socialNeeds;
  final int? strangerFriendly;
  const BreedEntity({
    required this.id,
    this.name,
    this.temperament,
    this.origin,
    this.description,
    this.lifeSpan,
    this.adaptability,
    this.affectionLevel,
    this.childFriendly,
    this.dogFriendly,
    this.energyLevel,
    this.intelligence,
    this.socialNeeds,
    this.strangerFriendly,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || temperament != null) {
      map['temperament'] = Variable<String>(temperament);
    }
    if (!nullToAbsent || origin != null) {
      map['origin'] = Variable<String>(origin);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || lifeSpan != null) {
      map['life_span'] = Variable<String>(lifeSpan);
    }
    if (!nullToAbsent || adaptability != null) {
      map['adaptability'] = Variable<int>(adaptability);
    }
    if (!nullToAbsent || affectionLevel != null) {
      map['affection_level'] = Variable<int>(affectionLevel);
    }
    if (!nullToAbsent || childFriendly != null) {
      map['child_friendly'] = Variable<int>(childFriendly);
    }
    if (!nullToAbsent || dogFriendly != null) {
      map['dog_friendly'] = Variable<int>(dogFriendly);
    }
    if (!nullToAbsent || energyLevel != null) {
      map['energy_level'] = Variable<int>(energyLevel);
    }
    if (!nullToAbsent || intelligence != null) {
      map['intelligence'] = Variable<int>(intelligence);
    }
    if (!nullToAbsent || socialNeeds != null) {
      map['social_needs'] = Variable<int>(socialNeeds);
    }
    if (!nullToAbsent || strangerFriendly != null) {
      map['stranger_friendly'] = Variable<int>(strangerFriendly);
    }
    return map;
  }

  BreedsCompanion toCompanion(bool nullToAbsent) {
    return BreedsCompanion(
      id: Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      temperament:
          temperament == null && nullToAbsent
              ? const Value.absent()
              : Value(temperament),
      origin:
          origin == null && nullToAbsent ? const Value.absent() : Value(origin),
      description:
          description == null && nullToAbsent
              ? const Value.absent()
              : Value(description),
      lifeSpan:
          lifeSpan == null && nullToAbsent
              ? const Value.absent()
              : Value(lifeSpan),
      adaptability:
          adaptability == null && nullToAbsent
              ? const Value.absent()
              : Value(adaptability),
      affectionLevel:
          affectionLevel == null && nullToAbsent
              ? const Value.absent()
              : Value(affectionLevel),
      childFriendly:
          childFriendly == null && nullToAbsent
              ? const Value.absent()
              : Value(childFriendly),
      dogFriendly:
          dogFriendly == null && nullToAbsent
              ? const Value.absent()
              : Value(dogFriendly),
      energyLevel:
          energyLevel == null && nullToAbsent
              ? const Value.absent()
              : Value(energyLevel),
      intelligence:
          intelligence == null && nullToAbsent
              ? const Value.absent()
              : Value(intelligence),
      socialNeeds:
          socialNeeds == null && nullToAbsent
              ? const Value.absent()
              : Value(socialNeeds),
      strangerFriendly:
          strangerFriendly == null && nullToAbsent
              ? const Value.absent()
              : Value(strangerFriendly),
    );
  }

  factory BreedEntity.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BreedEntity(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String?>(json['name']),
      temperament: serializer.fromJson<String?>(json['temperament']),
      origin: serializer.fromJson<String?>(json['origin']),
      description: serializer.fromJson<String?>(json['description']),
      lifeSpan: serializer.fromJson<String?>(json['lifeSpan']),
      adaptability: serializer.fromJson<int?>(json['adaptability']),
      affectionLevel: serializer.fromJson<int?>(json['affectionLevel']),
      childFriendly: serializer.fromJson<int?>(json['childFriendly']),
      dogFriendly: serializer.fromJson<int?>(json['dogFriendly']),
      energyLevel: serializer.fromJson<int?>(json['energyLevel']),
      intelligence: serializer.fromJson<int?>(json['intelligence']),
      socialNeeds: serializer.fromJson<int?>(json['socialNeeds']),
      strangerFriendly: serializer.fromJson<int?>(json['strangerFriendly']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String?>(name),
      'temperament': serializer.toJson<String?>(temperament),
      'origin': serializer.toJson<String?>(origin),
      'description': serializer.toJson<String?>(description),
      'lifeSpan': serializer.toJson<String?>(lifeSpan),
      'adaptability': serializer.toJson<int?>(adaptability),
      'affectionLevel': serializer.toJson<int?>(affectionLevel),
      'childFriendly': serializer.toJson<int?>(childFriendly),
      'dogFriendly': serializer.toJson<int?>(dogFriendly),
      'energyLevel': serializer.toJson<int?>(energyLevel),
      'intelligence': serializer.toJson<int?>(intelligence),
      'socialNeeds': serializer.toJson<int?>(socialNeeds),
      'strangerFriendly': serializer.toJson<int?>(strangerFriendly),
    };
  }

  BreedEntity copyWith({
    String? id,
    Value<String?> name = const Value.absent(),
    Value<String?> temperament = const Value.absent(),
    Value<String?> origin = const Value.absent(),
    Value<String?> description = const Value.absent(),
    Value<String?> lifeSpan = const Value.absent(),
    Value<int?> adaptability = const Value.absent(),
    Value<int?> affectionLevel = const Value.absent(),
    Value<int?> childFriendly = const Value.absent(),
    Value<int?> dogFriendly = const Value.absent(),
    Value<int?> energyLevel = const Value.absent(),
    Value<int?> intelligence = const Value.absent(),
    Value<int?> socialNeeds = const Value.absent(),
    Value<int?> strangerFriendly = const Value.absent(),
  }) => BreedEntity(
    id: id ?? this.id,
    name: name.present ? name.value : this.name,
    temperament: temperament.present ? temperament.value : this.temperament,
    origin: origin.present ? origin.value : this.origin,
    description: description.present ? description.value : this.description,
    lifeSpan: lifeSpan.present ? lifeSpan.value : this.lifeSpan,
    adaptability: adaptability.present ? adaptability.value : this.adaptability,
    affectionLevel:
        affectionLevel.present ? affectionLevel.value : this.affectionLevel,
    childFriendly:
        childFriendly.present ? childFriendly.value : this.childFriendly,
    dogFriendly: dogFriendly.present ? dogFriendly.value : this.dogFriendly,
    energyLevel: energyLevel.present ? energyLevel.value : this.energyLevel,
    intelligence: intelligence.present ? intelligence.value : this.intelligence,
    socialNeeds: socialNeeds.present ? socialNeeds.value : this.socialNeeds,
    strangerFriendly:
        strangerFriendly.present
            ? strangerFriendly.value
            : this.strangerFriendly,
  );
  BreedEntity copyWithCompanion(BreedsCompanion data) {
    return BreedEntity(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      temperament:
          data.temperament.present ? data.temperament.value : this.temperament,
      origin: data.origin.present ? data.origin.value : this.origin,
      description:
          data.description.present ? data.description.value : this.description,
      lifeSpan: data.lifeSpan.present ? data.lifeSpan.value : this.lifeSpan,
      adaptability:
          data.adaptability.present
              ? data.adaptability.value
              : this.adaptability,
      affectionLevel:
          data.affectionLevel.present
              ? data.affectionLevel.value
              : this.affectionLevel,
      childFriendly:
          data.childFriendly.present
              ? data.childFriendly.value
              : this.childFriendly,
      dogFriendly:
          data.dogFriendly.present ? data.dogFriendly.value : this.dogFriendly,
      energyLevel:
          data.energyLevel.present ? data.energyLevel.value : this.energyLevel,
      intelligence:
          data.intelligence.present
              ? data.intelligence.value
              : this.intelligence,
      socialNeeds:
          data.socialNeeds.present ? data.socialNeeds.value : this.socialNeeds,
      strangerFriendly:
          data.strangerFriendly.present
              ? data.strangerFriendly.value
              : this.strangerFriendly,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BreedEntity(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('temperament: $temperament, ')
          ..write('origin: $origin, ')
          ..write('description: $description, ')
          ..write('lifeSpan: $lifeSpan, ')
          ..write('adaptability: $adaptability, ')
          ..write('affectionLevel: $affectionLevel, ')
          ..write('childFriendly: $childFriendly, ')
          ..write('dogFriendly: $dogFriendly, ')
          ..write('energyLevel: $energyLevel, ')
          ..write('intelligence: $intelligence, ')
          ..write('socialNeeds: $socialNeeds, ')
          ..write('strangerFriendly: $strangerFriendly')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    temperament,
    origin,
    description,
    lifeSpan,
    adaptability,
    affectionLevel,
    childFriendly,
    dogFriendly,
    energyLevel,
    intelligence,
    socialNeeds,
    strangerFriendly,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BreedEntity &&
          other.id == this.id &&
          other.name == this.name &&
          other.temperament == this.temperament &&
          other.origin == this.origin &&
          other.description == this.description &&
          other.lifeSpan == this.lifeSpan &&
          other.adaptability == this.adaptability &&
          other.affectionLevel == this.affectionLevel &&
          other.childFriendly == this.childFriendly &&
          other.dogFriendly == this.dogFriendly &&
          other.energyLevel == this.energyLevel &&
          other.intelligence == this.intelligence &&
          other.socialNeeds == this.socialNeeds &&
          other.strangerFriendly == this.strangerFriendly);
}

class BreedsCompanion extends UpdateCompanion<BreedEntity> {
  final Value<String> id;
  final Value<String?> name;
  final Value<String?> temperament;
  final Value<String?> origin;
  final Value<String?> description;
  final Value<String?> lifeSpan;
  final Value<int?> adaptability;
  final Value<int?> affectionLevel;
  final Value<int?> childFriendly;
  final Value<int?> dogFriendly;
  final Value<int?> energyLevel;
  final Value<int?> intelligence;
  final Value<int?> socialNeeds;
  final Value<int?> strangerFriendly;
  final Value<int> rowid;
  const BreedsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.temperament = const Value.absent(),
    this.origin = const Value.absent(),
    this.description = const Value.absent(),
    this.lifeSpan = const Value.absent(),
    this.adaptability = const Value.absent(),
    this.affectionLevel = const Value.absent(),
    this.childFriendly = const Value.absent(),
    this.dogFriendly = const Value.absent(),
    this.energyLevel = const Value.absent(),
    this.intelligence = const Value.absent(),
    this.socialNeeds = const Value.absent(),
    this.strangerFriendly = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  BreedsCompanion.insert({
    required String id,
    this.name = const Value.absent(),
    this.temperament = const Value.absent(),
    this.origin = const Value.absent(),
    this.description = const Value.absent(),
    this.lifeSpan = const Value.absent(),
    this.adaptability = const Value.absent(),
    this.affectionLevel = const Value.absent(),
    this.childFriendly = const Value.absent(),
    this.dogFriendly = const Value.absent(),
    this.energyLevel = const Value.absent(),
    this.intelligence = const Value.absent(),
    this.socialNeeds = const Value.absent(),
    this.strangerFriendly = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id);
  static Insertable<BreedEntity> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? temperament,
    Expression<String>? origin,
    Expression<String>? description,
    Expression<String>? lifeSpan,
    Expression<int>? adaptability,
    Expression<int>? affectionLevel,
    Expression<int>? childFriendly,
    Expression<int>? dogFriendly,
    Expression<int>? energyLevel,
    Expression<int>? intelligence,
    Expression<int>? socialNeeds,
    Expression<int>? strangerFriendly,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (temperament != null) 'temperament': temperament,
      if (origin != null) 'origin': origin,
      if (description != null) 'description': description,
      if (lifeSpan != null) 'life_span': lifeSpan,
      if (adaptability != null) 'adaptability': adaptability,
      if (affectionLevel != null) 'affection_level': affectionLevel,
      if (childFriendly != null) 'child_friendly': childFriendly,
      if (dogFriendly != null) 'dog_friendly': dogFriendly,
      if (energyLevel != null) 'energy_level': energyLevel,
      if (intelligence != null) 'intelligence': intelligence,
      if (socialNeeds != null) 'social_needs': socialNeeds,
      if (strangerFriendly != null) 'stranger_friendly': strangerFriendly,
      if (rowid != null) 'rowid': rowid,
    });
  }

  BreedsCompanion copyWith({
    Value<String>? id,
    Value<String?>? name,
    Value<String?>? temperament,
    Value<String?>? origin,
    Value<String?>? description,
    Value<String?>? lifeSpan,
    Value<int?>? adaptability,
    Value<int?>? affectionLevel,
    Value<int?>? childFriendly,
    Value<int?>? dogFriendly,
    Value<int?>? energyLevel,
    Value<int?>? intelligence,
    Value<int?>? socialNeeds,
    Value<int?>? strangerFriendly,
    Value<int>? rowid,
  }) {
    return BreedsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      temperament: temperament ?? this.temperament,
      origin: origin ?? this.origin,
      description: description ?? this.description,
      lifeSpan: lifeSpan ?? this.lifeSpan,
      adaptability: adaptability ?? this.adaptability,
      affectionLevel: affectionLevel ?? this.affectionLevel,
      childFriendly: childFriendly ?? this.childFriendly,
      dogFriendly: dogFriendly ?? this.dogFriendly,
      energyLevel: energyLevel ?? this.energyLevel,
      intelligence: intelligence ?? this.intelligence,
      socialNeeds: socialNeeds ?? this.socialNeeds,
      strangerFriendly: strangerFriendly ?? this.strangerFriendly,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (temperament.present) {
      map['temperament'] = Variable<String>(temperament.value);
    }
    if (origin.present) {
      map['origin'] = Variable<String>(origin.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (lifeSpan.present) {
      map['life_span'] = Variable<String>(lifeSpan.value);
    }
    if (adaptability.present) {
      map['adaptability'] = Variable<int>(adaptability.value);
    }
    if (affectionLevel.present) {
      map['affection_level'] = Variable<int>(affectionLevel.value);
    }
    if (childFriendly.present) {
      map['child_friendly'] = Variable<int>(childFriendly.value);
    }
    if (dogFriendly.present) {
      map['dog_friendly'] = Variable<int>(dogFriendly.value);
    }
    if (energyLevel.present) {
      map['energy_level'] = Variable<int>(energyLevel.value);
    }
    if (intelligence.present) {
      map['intelligence'] = Variable<int>(intelligence.value);
    }
    if (socialNeeds.present) {
      map['social_needs'] = Variable<int>(socialNeeds.value);
    }
    if (strangerFriendly.present) {
      map['stranger_friendly'] = Variable<int>(strangerFriendly.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BreedsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('temperament: $temperament, ')
          ..write('origin: $origin, ')
          ..write('description: $description, ')
          ..write('lifeSpan: $lifeSpan, ')
          ..write('adaptability: $adaptability, ')
          ..write('affectionLevel: $affectionLevel, ')
          ..write('childFriendly: $childFriendly, ')
          ..write('dogFriendly: $dogFriendly, ')
          ..write('energyLevel: $energyLevel, ')
          ..write('intelligence: $intelligence, ')
          ..write('socialNeeds: $socialNeeds, ')
          ..write('strangerFriendly: $strangerFriendly, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CatBreedsTable extends CatBreeds
    with TableInfo<$CatBreedsTable, CatBreedEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CatBreedsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _catIdMeta = const VerificationMeta('catId');
  @override
  late final GeneratedColumn<String> catId = GeneratedColumn<String>(
    'cat_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'REFERENCES liked_cats(id) ON DELETE CASCADE NOT NULL',
  );
  static const VerificationMeta _breedIdMeta = const VerificationMeta(
    'breedId',
  );
  @override
  late final GeneratedColumn<String> breedId = GeneratedColumn<String>(
    'breed_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'REFERENCES breeds(id) ON DELETE CASCADE NOT NULL',
  );
  @override
  List<GeneratedColumn> get $columns => [catId, breedId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cat_breeds';
  @override
  VerificationContext validateIntegrity(
    Insertable<CatBreedEntity> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('cat_id')) {
      context.handle(
        _catIdMeta,
        catId.isAcceptableOrUnknown(data['cat_id']!, _catIdMeta),
      );
    } else if (isInserting) {
      context.missing(_catIdMeta);
    }
    if (data.containsKey('breed_id')) {
      context.handle(
        _breedIdMeta,
        breedId.isAcceptableOrUnknown(data['breed_id']!, _breedIdMeta),
      );
    } else if (isInserting) {
      context.missing(_breedIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {catId, breedId};
  @override
  CatBreedEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CatBreedEntity(
      catId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}cat_id'],
          )!,
      breedId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}breed_id'],
          )!,
    );
  }

  @override
  $CatBreedsTable createAlias(String alias) {
    return $CatBreedsTable(attachedDatabase, alias);
  }
}

class CatBreedEntity extends DataClass implements Insertable<CatBreedEntity> {
  final String catId;
  final String breedId;
  const CatBreedEntity({required this.catId, required this.breedId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['cat_id'] = Variable<String>(catId);
    map['breed_id'] = Variable<String>(breedId);
    return map;
  }

  CatBreedsCompanion toCompanion(bool nullToAbsent) {
    return CatBreedsCompanion(catId: Value(catId), breedId: Value(breedId));
  }

  factory CatBreedEntity.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CatBreedEntity(
      catId: serializer.fromJson<String>(json['catId']),
      breedId: serializer.fromJson<String>(json['breedId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'catId': serializer.toJson<String>(catId),
      'breedId': serializer.toJson<String>(breedId),
    };
  }

  CatBreedEntity copyWith({String? catId, String? breedId}) => CatBreedEntity(
    catId: catId ?? this.catId,
    breedId: breedId ?? this.breedId,
  );
  CatBreedEntity copyWithCompanion(CatBreedsCompanion data) {
    return CatBreedEntity(
      catId: data.catId.present ? data.catId.value : this.catId,
      breedId: data.breedId.present ? data.breedId.value : this.breedId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CatBreedEntity(')
          ..write('catId: $catId, ')
          ..write('breedId: $breedId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(catId, breedId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CatBreedEntity &&
          other.catId == this.catId &&
          other.breedId == this.breedId);
}

class CatBreedsCompanion extends UpdateCompanion<CatBreedEntity> {
  final Value<String> catId;
  final Value<String> breedId;
  final Value<int> rowid;
  const CatBreedsCompanion({
    this.catId = const Value.absent(),
    this.breedId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CatBreedsCompanion.insert({
    required String catId,
    required String breedId,
    this.rowid = const Value.absent(),
  }) : catId = Value(catId),
       breedId = Value(breedId);
  static Insertable<CatBreedEntity> custom({
    Expression<String>? catId,
    Expression<String>? breedId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (catId != null) 'cat_id': catId,
      if (breedId != null) 'breed_id': breedId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CatBreedsCompanion copyWith({
    Value<String>? catId,
    Value<String>? breedId,
    Value<int>? rowid,
  }) {
    return CatBreedsCompanion(
      catId: catId ?? this.catId,
      breedId: breedId ?? this.breedId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (catId.present) {
      map['cat_id'] = Variable<String>(catId.value);
    }
    if (breedId.present) {
      map['breed_id'] = Variable<String>(breedId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CatBreedsCompanion(')
          ..write('catId: $catId, ')
          ..write('breedId: $breedId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$LocalDatabase extends GeneratedDatabase {
  _$LocalDatabase(QueryExecutor e) : super(e);
  $LocalDatabaseManager get managers => $LocalDatabaseManager(this);
  late final $LikedCatsTable likedCats = $LikedCatsTable(this);
  late final $BreedsTable breeds = $BreedsTable(this);
  late final $CatBreedsTable catBreeds = $CatBreedsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    likedCats,
    breeds,
    catBreeds,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'liked_cats',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('cat_breeds', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'breeds',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('cat_breeds', kind: UpdateKind.delete)],
    ),
  ]);
}

typedef $$LikedCatsTableCreateCompanionBuilder =
    LikedCatsCompanion Function({
      required String id,
      Value<String?> url,
      required DateTime datetime,
      Value<int> rowid,
    });
typedef $$LikedCatsTableUpdateCompanionBuilder =
    LikedCatsCompanion Function({
      Value<String> id,
      Value<String?> url,
      Value<DateTime> datetime,
      Value<int> rowid,
    });

final class $$LikedCatsTableReferences
    extends BaseReferences<_$LocalDatabase, $LikedCatsTable, LikedCatEntity> {
  $$LikedCatsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$CatBreedsTable, List<CatBreedEntity>>
  _catBreedsRefsTable(_$LocalDatabase db) => MultiTypedResultKey.fromTable(
    db.catBreeds,
    aliasName: $_aliasNameGenerator(db.likedCats.id, db.catBreeds.catId),
  );

  $$CatBreedsTableProcessedTableManager get catBreedsRefs {
    final manager = $$CatBreedsTableTableManager(
      $_db,
      $_db.catBreeds,
    ).filter((f) => f.catId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_catBreedsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$LikedCatsTableFilterComposer
    extends Composer<_$LocalDatabase, $LikedCatsTable> {
  $$LikedCatsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get url => $composableBuilder(
    column: $table.url,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get datetime => $composableBuilder(
    column: $table.datetime,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> catBreedsRefs(
    Expression<bool> Function($$CatBreedsTableFilterComposer f) f,
  ) {
    final $$CatBreedsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.catBreeds,
      getReferencedColumn: (t) => t.catId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CatBreedsTableFilterComposer(
            $db: $db,
            $table: $db.catBreeds,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$LikedCatsTableOrderingComposer
    extends Composer<_$LocalDatabase, $LikedCatsTable> {
  $$LikedCatsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get url => $composableBuilder(
    column: $table.url,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get datetime => $composableBuilder(
    column: $table.datetime,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$LikedCatsTableAnnotationComposer
    extends Composer<_$LocalDatabase, $LikedCatsTable> {
  $$LikedCatsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get url =>
      $composableBuilder(column: $table.url, builder: (column) => column);

  GeneratedColumn<DateTime> get datetime =>
      $composableBuilder(column: $table.datetime, builder: (column) => column);

  Expression<T> catBreedsRefs<T extends Object>(
    Expression<T> Function($$CatBreedsTableAnnotationComposer a) f,
  ) {
    final $$CatBreedsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.catBreeds,
      getReferencedColumn: (t) => t.catId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CatBreedsTableAnnotationComposer(
            $db: $db,
            $table: $db.catBreeds,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$LikedCatsTableTableManager
    extends
        RootTableManager<
          _$LocalDatabase,
          $LikedCatsTable,
          LikedCatEntity,
          $$LikedCatsTableFilterComposer,
          $$LikedCatsTableOrderingComposer,
          $$LikedCatsTableAnnotationComposer,
          $$LikedCatsTableCreateCompanionBuilder,
          $$LikedCatsTableUpdateCompanionBuilder,
          (LikedCatEntity, $$LikedCatsTableReferences),
          LikedCatEntity,
          PrefetchHooks Function({bool catBreedsRefs})
        > {
  $$LikedCatsTableTableManager(_$LocalDatabase db, $LikedCatsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$LikedCatsTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$LikedCatsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$LikedCatsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String?> url = const Value.absent(),
                Value<DateTime> datetime = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LikedCatsCompanion(
                id: id,
                url: url,
                datetime: datetime,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<String?> url = const Value.absent(),
                required DateTime datetime,
                Value<int> rowid = const Value.absent(),
              }) => LikedCatsCompanion.insert(
                id: id,
                url: url,
                datetime: datetime,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$LikedCatsTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({catBreedsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (catBreedsRefs) db.catBreeds],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (catBreedsRefs)
                    await $_getPrefetchedData<
                      LikedCatEntity,
                      $LikedCatsTable,
                      CatBreedEntity
                    >(
                      currentTable: table,
                      referencedTable: $$LikedCatsTableReferences
                          ._catBreedsRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$LikedCatsTableReferences(
                                db,
                                table,
                                p0,
                              ).catBreedsRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) =>
                              referencedItems.where((e) => e.catId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$LikedCatsTableProcessedTableManager =
    ProcessedTableManager<
      _$LocalDatabase,
      $LikedCatsTable,
      LikedCatEntity,
      $$LikedCatsTableFilterComposer,
      $$LikedCatsTableOrderingComposer,
      $$LikedCatsTableAnnotationComposer,
      $$LikedCatsTableCreateCompanionBuilder,
      $$LikedCatsTableUpdateCompanionBuilder,
      (LikedCatEntity, $$LikedCatsTableReferences),
      LikedCatEntity,
      PrefetchHooks Function({bool catBreedsRefs})
    >;
typedef $$BreedsTableCreateCompanionBuilder =
    BreedsCompanion Function({
      required String id,
      Value<String?> name,
      Value<String?> temperament,
      Value<String?> origin,
      Value<String?> description,
      Value<String?> lifeSpan,
      Value<int?> adaptability,
      Value<int?> affectionLevel,
      Value<int?> childFriendly,
      Value<int?> dogFriendly,
      Value<int?> energyLevel,
      Value<int?> intelligence,
      Value<int?> socialNeeds,
      Value<int?> strangerFriendly,
      Value<int> rowid,
    });
typedef $$BreedsTableUpdateCompanionBuilder =
    BreedsCompanion Function({
      Value<String> id,
      Value<String?> name,
      Value<String?> temperament,
      Value<String?> origin,
      Value<String?> description,
      Value<String?> lifeSpan,
      Value<int?> adaptability,
      Value<int?> affectionLevel,
      Value<int?> childFriendly,
      Value<int?> dogFriendly,
      Value<int?> energyLevel,
      Value<int?> intelligence,
      Value<int?> socialNeeds,
      Value<int?> strangerFriendly,
      Value<int> rowid,
    });

final class $$BreedsTableReferences
    extends BaseReferences<_$LocalDatabase, $BreedsTable, BreedEntity> {
  $$BreedsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$CatBreedsTable, List<CatBreedEntity>>
  _catBreedsRefsTable(_$LocalDatabase db) => MultiTypedResultKey.fromTable(
    db.catBreeds,
    aliasName: $_aliasNameGenerator(db.breeds.id, db.catBreeds.breedId),
  );

  $$CatBreedsTableProcessedTableManager get catBreedsRefs {
    final manager = $$CatBreedsTableTableManager(
      $_db,
      $_db.catBreeds,
    ).filter((f) => f.breedId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_catBreedsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$BreedsTableFilterComposer
    extends Composer<_$LocalDatabase, $BreedsTable> {
  $$BreedsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get temperament => $composableBuilder(
    column: $table.temperament,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get origin => $composableBuilder(
    column: $table.origin,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lifeSpan => $composableBuilder(
    column: $table.lifeSpan,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get adaptability => $composableBuilder(
    column: $table.adaptability,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get affectionLevel => $composableBuilder(
    column: $table.affectionLevel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get childFriendly => $composableBuilder(
    column: $table.childFriendly,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get dogFriendly => $composableBuilder(
    column: $table.dogFriendly,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get energyLevel => $composableBuilder(
    column: $table.energyLevel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get intelligence => $composableBuilder(
    column: $table.intelligence,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get socialNeeds => $composableBuilder(
    column: $table.socialNeeds,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get strangerFriendly => $composableBuilder(
    column: $table.strangerFriendly,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> catBreedsRefs(
    Expression<bool> Function($$CatBreedsTableFilterComposer f) f,
  ) {
    final $$CatBreedsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.catBreeds,
      getReferencedColumn: (t) => t.breedId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CatBreedsTableFilterComposer(
            $db: $db,
            $table: $db.catBreeds,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$BreedsTableOrderingComposer
    extends Composer<_$LocalDatabase, $BreedsTable> {
  $$BreedsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get temperament => $composableBuilder(
    column: $table.temperament,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get origin => $composableBuilder(
    column: $table.origin,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lifeSpan => $composableBuilder(
    column: $table.lifeSpan,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get adaptability => $composableBuilder(
    column: $table.adaptability,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get affectionLevel => $composableBuilder(
    column: $table.affectionLevel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get childFriendly => $composableBuilder(
    column: $table.childFriendly,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get dogFriendly => $composableBuilder(
    column: $table.dogFriendly,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get energyLevel => $composableBuilder(
    column: $table.energyLevel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get intelligence => $composableBuilder(
    column: $table.intelligence,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get socialNeeds => $composableBuilder(
    column: $table.socialNeeds,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get strangerFriendly => $composableBuilder(
    column: $table.strangerFriendly,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$BreedsTableAnnotationComposer
    extends Composer<_$LocalDatabase, $BreedsTable> {
  $$BreedsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get temperament => $composableBuilder(
    column: $table.temperament,
    builder: (column) => column,
  );

  GeneratedColumn<String> get origin =>
      $composableBuilder(column: $table.origin, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get lifeSpan =>
      $composableBuilder(column: $table.lifeSpan, builder: (column) => column);

  GeneratedColumn<int> get adaptability => $composableBuilder(
    column: $table.adaptability,
    builder: (column) => column,
  );

  GeneratedColumn<int> get affectionLevel => $composableBuilder(
    column: $table.affectionLevel,
    builder: (column) => column,
  );

  GeneratedColumn<int> get childFriendly => $composableBuilder(
    column: $table.childFriendly,
    builder: (column) => column,
  );

  GeneratedColumn<int> get dogFriendly => $composableBuilder(
    column: $table.dogFriendly,
    builder: (column) => column,
  );

  GeneratedColumn<int> get energyLevel => $composableBuilder(
    column: $table.energyLevel,
    builder: (column) => column,
  );

  GeneratedColumn<int> get intelligence => $composableBuilder(
    column: $table.intelligence,
    builder: (column) => column,
  );

  GeneratedColumn<int> get socialNeeds => $composableBuilder(
    column: $table.socialNeeds,
    builder: (column) => column,
  );

  GeneratedColumn<int> get strangerFriendly => $composableBuilder(
    column: $table.strangerFriendly,
    builder: (column) => column,
  );

  Expression<T> catBreedsRefs<T extends Object>(
    Expression<T> Function($$CatBreedsTableAnnotationComposer a) f,
  ) {
    final $$CatBreedsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.catBreeds,
      getReferencedColumn: (t) => t.breedId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CatBreedsTableAnnotationComposer(
            $db: $db,
            $table: $db.catBreeds,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$BreedsTableTableManager
    extends
        RootTableManager<
          _$LocalDatabase,
          $BreedsTable,
          BreedEntity,
          $$BreedsTableFilterComposer,
          $$BreedsTableOrderingComposer,
          $$BreedsTableAnnotationComposer,
          $$BreedsTableCreateCompanionBuilder,
          $$BreedsTableUpdateCompanionBuilder,
          (BreedEntity, $$BreedsTableReferences),
          BreedEntity,
          PrefetchHooks Function({bool catBreedsRefs})
        > {
  $$BreedsTableTableManager(_$LocalDatabase db, $BreedsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$BreedsTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$BreedsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$BreedsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String?> name = const Value.absent(),
                Value<String?> temperament = const Value.absent(),
                Value<String?> origin = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> lifeSpan = const Value.absent(),
                Value<int?> adaptability = const Value.absent(),
                Value<int?> affectionLevel = const Value.absent(),
                Value<int?> childFriendly = const Value.absent(),
                Value<int?> dogFriendly = const Value.absent(),
                Value<int?> energyLevel = const Value.absent(),
                Value<int?> intelligence = const Value.absent(),
                Value<int?> socialNeeds = const Value.absent(),
                Value<int?> strangerFriendly = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => BreedsCompanion(
                id: id,
                name: name,
                temperament: temperament,
                origin: origin,
                description: description,
                lifeSpan: lifeSpan,
                adaptability: adaptability,
                affectionLevel: affectionLevel,
                childFriendly: childFriendly,
                dogFriendly: dogFriendly,
                energyLevel: energyLevel,
                intelligence: intelligence,
                socialNeeds: socialNeeds,
                strangerFriendly: strangerFriendly,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<String?> name = const Value.absent(),
                Value<String?> temperament = const Value.absent(),
                Value<String?> origin = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> lifeSpan = const Value.absent(),
                Value<int?> adaptability = const Value.absent(),
                Value<int?> affectionLevel = const Value.absent(),
                Value<int?> childFriendly = const Value.absent(),
                Value<int?> dogFriendly = const Value.absent(),
                Value<int?> energyLevel = const Value.absent(),
                Value<int?> intelligence = const Value.absent(),
                Value<int?> socialNeeds = const Value.absent(),
                Value<int?> strangerFriendly = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => BreedsCompanion.insert(
                id: id,
                name: name,
                temperament: temperament,
                origin: origin,
                description: description,
                lifeSpan: lifeSpan,
                adaptability: adaptability,
                affectionLevel: affectionLevel,
                childFriendly: childFriendly,
                dogFriendly: dogFriendly,
                energyLevel: energyLevel,
                intelligence: intelligence,
                socialNeeds: socialNeeds,
                strangerFriendly: strangerFriendly,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$BreedsTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({catBreedsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (catBreedsRefs) db.catBreeds],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (catBreedsRefs)
                    await $_getPrefetchedData<
                      BreedEntity,
                      $BreedsTable,
                      CatBreedEntity
                    >(
                      currentTable: table,
                      referencedTable: $$BreedsTableReferences
                          ._catBreedsRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$BreedsTableReferences(
                                db,
                                table,
                                p0,
                              ).catBreedsRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.breedId == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$BreedsTableProcessedTableManager =
    ProcessedTableManager<
      _$LocalDatabase,
      $BreedsTable,
      BreedEntity,
      $$BreedsTableFilterComposer,
      $$BreedsTableOrderingComposer,
      $$BreedsTableAnnotationComposer,
      $$BreedsTableCreateCompanionBuilder,
      $$BreedsTableUpdateCompanionBuilder,
      (BreedEntity, $$BreedsTableReferences),
      BreedEntity,
      PrefetchHooks Function({bool catBreedsRefs})
    >;
typedef $$CatBreedsTableCreateCompanionBuilder =
    CatBreedsCompanion Function({
      required String catId,
      required String breedId,
      Value<int> rowid,
    });
typedef $$CatBreedsTableUpdateCompanionBuilder =
    CatBreedsCompanion Function({
      Value<String> catId,
      Value<String> breedId,
      Value<int> rowid,
    });

final class $$CatBreedsTableReferences
    extends BaseReferences<_$LocalDatabase, $CatBreedsTable, CatBreedEntity> {
  $$CatBreedsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $LikedCatsTable _catIdTable(_$LocalDatabase db) => db.likedCats
      .createAlias($_aliasNameGenerator(db.catBreeds.catId, db.likedCats.id));

  $$LikedCatsTableProcessedTableManager get catId {
    final $_column = $_itemColumn<String>('cat_id')!;

    final manager = $$LikedCatsTableTableManager(
      $_db,
      $_db.likedCats,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_catIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $BreedsTable _breedIdTable(_$LocalDatabase db) => db.breeds
      .createAlias($_aliasNameGenerator(db.catBreeds.breedId, db.breeds.id));

  $$BreedsTableProcessedTableManager get breedId {
    final $_column = $_itemColumn<String>('breed_id')!;

    final manager = $$BreedsTableTableManager(
      $_db,
      $_db.breeds,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_breedIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$CatBreedsTableFilterComposer
    extends Composer<_$LocalDatabase, $CatBreedsTable> {
  $$CatBreedsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$LikedCatsTableFilterComposer get catId {
    final $$LikedCatsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.catId,
      referencedTable: $db.likedCats,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LikedCatsTableFilterComposer(
            $db: $db,
            $table: $db.likedCats,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$BreedsTableFilterComposer get breedId {
    final $$BreedsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.breedId,
      referencedTable: $db.breeds,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BreedsTableFilterComposer(
            $db: $db,
            $table: $db.breeds,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CatBreedsTableOrderingComposer
    extends Composer<_$LocalDatabase, $CatBreedsTable> {
  $$CatBreedsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$LikedCatsTableOrderingComposer get catId {
    final $$LikedCatsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.catId,
      referencedTable: $db.likedCats,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LikedCatsTableOrderingComposer(
            $db: $db,
            $table: $db.likedCats,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$BreedsTableOrderingComposer get breedId {
    final $$BreedsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.breedId,
      referencedTable: $db.breeds,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BreedsTableOrderingComposer(
            $db: $db,
            $table: $db.breeds,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CatBreedsTableAnnotationComposer
    extends Composer<_$LocalDatabase, $CatBreedsTable> {
  $$CatBreedsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$LikedCatsTableAnnotationComposer get catId {
    final $$LikedCatsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.catId,
      referencedTable: $db.likedCats,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LikedCatsTableAnnotationComposer(
            $db: $db,
            $table: $db.likedCats,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$BreedsTableAnnotationComposer get breedId {
    final $$BreedsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.breedId,
      referencedTable: $db.breeds,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BreedsTableAnnotationComposer(
            $db: $db,
            $table: $db.breeds,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CatBreedsTableTableManager
    extends
        RootTableManager<
          _$LocalDatabase,
          $CatBreedsTable,
          CatBreedEntity,
          $$CatBreedsTableFilterComposer,
          $$CatBreedsTableOrderingComposer,
          $$CatBreedsTableAnnotationComposer,
          $$CatBreedsTableCreateCompanionBuilder,
          $$CatBreedsTableUpdateCompanionBuilder,
          (CatBreedEntity, $$CatBreedsTableReferences),
          CatBreedEntity,
          PrefetchHooks Function({bool catId, bool breedId})
        > {
  $$CatBreedsTableTableManager(_$LocalDatabase db, $CatBreedsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$CatBreedsTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$CatBreedsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$CatBreedsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> catId = const Value.absent(),
                Value<String> breedId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CatBreedsCompanion(
                catId: catId,
                breedId: breedId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String catId,
                required String breedId,
                Value<int> rowid = const Value.absent(),
              }) => CatBreedsCompanion.insert(
                catId: catId,
                breedId: breedId,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$CatBreedsTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({catId = false, breedId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                T extends TableManagerState<
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic
                >
              >(state) {
                if (catId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.catId,
                            referencedTable: $$CatBreedsTableReferences
                                ._catIdTable(db),
                            referencedColumn:
                                $$CatBreedsTableReferences._catIdTable(db).id,
                          )
                          as T;
                }
                if (breedId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.breedId,
                            referencedTable: $$CatBreedsTableReferences
                                ._breedIdTable(db),
                            referencedColumn:
                                $$CatBreedsTableReferences._breedIdTable(db).id,
                          )
                          as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$CatBreedsTableProcessedTableManager =
    ProcessedTableManager<
      _$LocalDatabase,
      $CatBreedsTable,
      CatBreedEntity,
      $$CatBreedsTableFilterComposer,
      $$CatBreedsTableOrderingComposer,
      $$CatBreedsTableAnnotationComposer,
      $$CatBreedsTableCreateCompanionBuilder,
      $$CatBreedsTableUpdateCompanionBuilder,
      (CatBreedEntity, $$CatBreedsTableReferences),
      CatBreedEntity,
      PrefetchHooks Function({bool catId, bool breedId})
    >;

class $LocalDatabaseManager {
  final _$LocalDatabase _db;
  $LocalDatabaseManager(this._db);
  $$LikedCatsTableTableManager get likedCats =>
      $$LikedCatsTableTableManager(_db, _db.likedCats);
  $$BreedsTableTableManager get breeds =>
      $$BreedsTableTableManager(_db, _db.breeds);
  $$CatBreedsTableTableManager get catBreeds =>
      $$CatBreedsTableTableManager(_db, _db.catBreeds);
}
