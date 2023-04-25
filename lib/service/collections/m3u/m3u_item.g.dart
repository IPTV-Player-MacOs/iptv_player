// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'm3u_item.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetM3UItemCollection on Isar {
  IsarCollection<M3UItem> get m3UItems => this.collection();
}

const M3UItemSchema = CollectionSchema(
  name: r'M3UItem',
  id: -8460140621635803672,
  properties: {
    r'attributes': PropertySchema(
      id: 0,
      name: r'attributes',
      type: IsarType.object,
      target: r'Attributes',
    ),
    r'duration': PropertySchema(
      id: 1,
      name: r'duration',
      type: IsarType.long,
    ),
    r'episode': PropertySchema(
      id: 2,
      name: r'episode',
      type: IsarType.string,
    ),
    r'groupTitle': PropertySchema(
      id: 3,
      name: r'groupTitle',
      type: IsarType.string,
    ),
    r'link': PropertySchema(
      id: 4,
      name: r'link',
      type: IsarType.string,
    ),
    r'name': PropertySchema(
      id: 5,
      name: r'name',
      type: IsarType.byte,
      enumMap: _M3UItemnameEnumValueMap,
    ),
    r'season': PropertySchema(
      id: 6,
      name: r'season',
      type: IsarType.string,
    ),
    r'title': PropertySchema(
      id: 7,
      name: r'title',
      type: IsarType.string,
    )
  },
  estimateSize: _m3UItemEstimateSize,
  serialize: _m3UItemSerialize,
  deserialize: _m3UItemDeserialize,
  deserializeProp: _m3UItemDeserializeProp,
  idName: r'id',
  indexes: {
    r'groupTitle': IndexSchema(
      id: -4459833654924190251,
      name: r'groupTitle',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'groupTitle',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {
    r'iptvServer': LinkSchema(
      id: -6020825740484226009,
      name: r'iptvServer',
      target: r'IptvServer',
      single: true,
    )
  },
  embeddedSchemas: {r'Attributes': AttributesSchema},
  getId: _m3UItemGetId,
  getLinks: _m3UItemGetLinks,
  attach: _m3UItemAttach,
  version: '3.1.0+1',
);

int _m3UItemEstimateSize(
  M3UItem object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.attributes;
    if (value != null) {
      bytesCount += 3 +
          AttributesSchema.estimateSize(
              value, allOffsets[Attributes]!, allOffsets);
    }
  }
  {
    final value = object.episode;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.groupTitle;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.link.length * 3;
  {
    final value = object.season;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.title;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _m3UItemSerialize(
  M3UItem object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObject<Attributes>(
    offsets[0],
    allOffsets,
    AttributesSchema.serialize,
    object.attributes,
  );
  writer.writeLong(offsets[1], object.duration);
  writer.writeString(offsets[2], object.episode);
  writer.writeString(offsets[3], object.groupTitle);
  writer.writeString(offsets[4], object.link);
  writer.writeByte(offsets[5], object.name.index);
  writer.writeString(offsets[6], object.season);
  writer.writeString(offsets[7], object.title);
}

M3UItem _m3UItemDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = M3UItem(
    reader.readString(offsets[4]),
    reader.readLongOrNull(offsets[1]),
    reader.readStringOrNull(offsets[7]),
    reader.readStringOrNull(offsets[3]),
    reader.readObjectOrNull<Attributes>(
      offsets[0],
      AttributesSchema.deserialize,
      allOffsets,
    ),
    _M3UItemnameValueEnumMap[reader.readByteOrNull(offsets[5])] ??
        M3UType.movie,
    reader.readStringOrNull(offsets[6]),
    reader.readStringOrNull(offsets[2]),
  );
  object.id = id;
  return object;
}

P _m3UItemDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectOrNull<Attributes>(
        offset,
        AttributesSchema.deserialize,
        allOffsets,
      )) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (_M3UItemnameValueEnumMap[reader.readByteOrNull(offset)] ??
          M3UType.movie) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _M3UItemnameEnumValueMap = {
  'movie': 0,
  'series': 1,
  'channel': 2,
};
const _M3UItemnameValueEnumMap = {
  0: M3UType.movie,
  1: M3UType.series,
  2: M3UType.channel,
};

Id _m3UItemGetId(M3UItem object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _m3UItemGetLinks(M3UItem object) {
  return [object.iptvServer];
}

void _m3UItemAttach(IsarCollection<dynamic> col, Id id, M3UItem object) {
  object.id = id;
  object.iptvServer
      .attach(col, col.isar.collection<IptvServer>(), r'iptvServer', id);
}

extension M3UItemQueryWhereSort on QueryBuilder<M3UItem, M3UItem, QWhere> {
  QueryBuilder<M3UItem, M3UItem, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension M3UItemQueryWhere on QueryBuilder<M3UItem, M3UItem, QWhereClause> {
  QueryBuilder<M3UItem, M3UItem, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<M3UItem, M3UItem, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<M3UItem, M3UItem, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<M3UItem, M3UItem, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<M3UItem, M3UItem, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<M3UItem, M3UItem, QAfterWhereClause> groupTitleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'groupTitle',
        value: [null],
      ));
    });
  }

  QueryBuilder<M3UItem, M3UItem, QAfterWhereClause> groupTitleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'groupTitle',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<M3UItem, M3UItem, QAfterWhereClause> groupTitleEqualTo(
      String? groupTitle) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'groupTitle',
        value: [groupTitle],
      ));
    });
  }

  QueryBuilder<M3UItem, M3UItem, QAfterWhereClause> groupTitleNotEqualTo(
      String? groupTitle) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'groupTitle',
              lower: [],
              upper: [groupTitle],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'groupTitle',
              lower: [groupTitle],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'groupTitle',
              lower: [groupTitle],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'groupTitle',
              lower: [],
              upper: [groupTitle],
              includeUpper: false,
            ));
      }
    });
  }
}

extension M3UItemQueryFilter
    on QueryBuilder<M3UItem, M3UItem, QFilterCondition> {
  QueryBuilder<M3UItem, M3UItem, QAfterFilterCondition> attributesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'attributes',
      ));
    });
  }

  QueryBuilder<M3UItem, M3UItem, QAfterFilterCondition> attributesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'attributes',
      ));
    });
  }

  QueryBuilder<M3UItem, M3UItem, QAfterFilterCondition> durationIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'duration',
      ));
    });
  }

  QueryBuilder<M3UItem, M3UItem, QAfterFilterCondition> durationIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'duration',
      ));
    });
  }

  QueryBuilder<M3UItem, M3UItem, QAfterFilterCondition> durationEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'duration',
        value: value,
      ));
    });
  }

  QueryBuilder<M3UItem, M3UItem, QAfterFilterCondition> durationGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'duration',
        value: value,
      ));
    });
  }

  QueryBuilder<M3UItem, M3UItem, QAfterFilterCondition> durationLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'duration',
        value: value,
      ));
    });
  }

  QueryBuilder<M3UItem, M3UItem, QAfterFilterCondition> durationBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'duration',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<M3UItem, M3UItem, QAfterFilterCondition> episodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'episode',
      ));
    });
  }

  QueryBuilder<M3UItem, M3UItem, QAfterFilterCondition> episodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'episode',
      ));
    });
  }

  QueryBuilder<M3UItem, M3UItem, QAfterFilterCondition> episodeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'episode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<M3UItem, M3UItem, QAfterFilterCondition> episodeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'episode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<M3UItem, M3UItem, QAfterFilterCondition> episodeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'episode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<M3UItem, M3UItem, QAfterFilterCondition> episodeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'episode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<M3UItem, M3UItem, QAfterFilterCondition> episodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'episode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<M3UItem, M3UItem, QAfterFilterCondition> episodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'episode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<M3UItem, M3UItem, QAfterFilterCondition> episodeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'episode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<M3UItem, M3UItem, QAfterFilterCondition> episodeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'episode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<M3UItem, M3UItem, QAfterFilterCondition> episodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'episode',
        value: '',
      ));
    });
  }

  QueryBuilder<M3UItem, M3UItem, QAfterFilterCondition> episodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'episode',
        value: '',
      ));
    });
  }

  QueryBuilder<M3UItem, M3UItem, QAfterFilterCondition> groupTitleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'groupTitle',
      ));
    });
  }

  QueryBuilder<M3UItem, M3UItem, QAfterFilterCondition> groupTitleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'groupTitle',
      ));
    });
  }

  QueryBuilder<M3UItem, M3UItem, QAfterFilterCondition> groupTitleEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'groupTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<M3UItem, M3UItem, QAfterFilterCondition> groupTitleGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'groupTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<M3UItem, M3UItem, QAfterFilterCondition> groupTitleLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'groupTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<M3UItem, M3UItem, QAfterFilterCondition> groupTitleBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'groupTitle',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<M3UItem, M3UItem, QAfterFilterCondition> groupTitleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'groupTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<M3UItem, M3UItem, QAfterFilterCondition> groupTitleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'groupTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<M3UItem, M3UItem, QAfterFilterCondition> groupTitleContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'groupTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<M3UItem, M3UItem, QAfterFilterCondition> groupTitleMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'groupTitle',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<M3UItem, M3UItem, QAfterFilterCondition> groupTitleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'groupTitle',
        value: '',
      ));
    });
  }

  QueryBuilder<M3UItem, M3UItem, QAfterFilterCondition> groupTitleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'groupTitle',
        value: '',
      ));
    });
  }

  QueryBuilder<M3UItem, M3UItem, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<M3UItem, M3UItem, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<M3UItem, M3UItem, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<M3UItem, M3UItem, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<M3UItem, M3UItem, QAfterFilterCondition> linkEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'link',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<M3UItem, M3UItem, QAfterFilterCondition> linkGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'link',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<M3UItem, M3UItem, QAfterFilterCondition> linkLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'link',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<M3UItem, M3UItem, QAfterFilterCondition> linkBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'link',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<M3UItem, M3UItem, QAfterFilterCondition> linkStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'link',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<M3UItem, M3UItem, QAfterFilterCondition> linkEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'link',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<M3UItem, M3UItem, QAfterFilterCondition> linkContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'link',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<M3UItem, M3UItem, QAfterFilterCondition> linkMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'link',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<M3UItem, M3UItem, QAfterFilterCondition> linkIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'link',
        value: '',
      ));
    });
  }

  QueryBuilder<M3UItem, M3UItem, QAfterFilterCondition> linkIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'link',
        value: '',
      ));
    });
  }

  QueryBuilder<M3UItem, M3UItem, QAfterFilterCondition> nameEqualTo(
      M3UType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
      ));
    });
  }

  QueryBuilder<M3UItem, M3UItem, QAfterFilterCondition> nameGreaterThan(
    M3UType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
      ));
    });
  }

  QueryBuilder<M3UItem, M3UItem, QAfterFilterCondition> nameLessThan(
    M3UType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
      ));
    });
  }

  QueryBuilder<M3UItem, M3UItem, QAfterFilterCondition> nameBetween(
    M3UType lower,
    M3UType upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<M3UItem, M3UItem, QAfterFilterCondition> seasonIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'season',
      ));
    });
  }

  QueryBuilder<M3UItem, M3UItem, QAfterFilterCondition> seasonIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'season',
      ));
    });
  }

  QueryBuilder<M3UItem, M3UItem, QAfterFilterCondition> seasonEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'season',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<M3UItem, M3UItem, QAfterFilterCondition> seasonGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'season',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<M3UItem, M3UItem, QAfterFilterCondition> seasonLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'season',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<M3UItem, M3UItem, QAfterFilterCondition> seasonBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'season',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<M3UItem, M3UItem, QAfterFilterCondition> seasonStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'season',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<M3UItem, M3UItem, QAfterFilterCondition> seasonEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'season',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<M3UItem, M3UItem, QAfterFilterCondition> seasonContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'season',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<M3UItem, M3UItem, QAfterFilterCondition> seasonMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'season',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<M3UItem, M3UItem, QAfterFilterCondition> seasonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'season',
        value: '',
      ));
    });
  }

  QueryBuilder<M3UItem, M3UItem, QAfterFilterCondition> seasonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'season',
        value: '',
      ));
    });
  }

  QueryBuilder<M3UItem, M3UItem, QAfterFilterCondition> titleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'title',
      ));
    });
  }

  QueryBuilder<M3UItem, M3UItem, QAfterFilterCondition> titleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'title',
      ));
    });
  }

  QueryBuilder<M3UItem, M3UItem, QAfterFilterCondition> titleEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<M3UItem, M3UItem, QAfterFilterCondition> titleGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<M3UItem, M3UItem, QAfterFilterCondition> titleLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<M3UItem, M3UItem, QAfterFilterCondition> titleBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'title',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<M3UItem, M3UItem, QAfterFilterCondition> titleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<M3UItem, M3UItem, QAfterFilterCondition> titleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<M3UItem, M3UItem, QAfterFilterCondition> titleContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<M3UItem, M3UItem, QAfterFilterCondition> titleMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'title',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<M3UItem, M3UItem, QAfterFilterCondition> titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<M3UItem, M3UItem, QAfterFilterCondition> titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'title',
        value: '',
      ));
    });
  }
}

extension M3UItemQueryObject
    on QueryBuilder<M3UItem, M3UItem, QFilterCondition> {
  QueryBuilder<M3UItem, M3UItem, QAfterFilterCondition> attributes(
      FilterQuery<Attributes> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'attributes');
    });
  }
}

extension M3UItemQueryLinks
    on QueryBuilder<M3UItem, M3UItem, QFilterCondition> {
  QueryBuilder<M3UItem, M3UItem, QAfterFilterCondition> iptvServer(
      FilterQuery<IptvServer> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'iptvServer');
    });
  }

  QueryBuilder<M3UItem, M3UItem, QAfterFilterCondition> iptvServerIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'iptvServer', 0, true, 0, true);
    });
  }
}

extension M3UItemQuerySortBy on QueryBuilder<M3UItem, M3UItem, QSortBy> {
  QueryBuilder<M3UItem, M3UItem, QAfterSortBy> sortByDuration() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'duration', Sort.asc);
    });
  }

  QueryBuilder<M3UItem, M3UItem, QAfterSortBy> sortByDurationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'duration', Sort.desc);
    });
  }

  QueryBuilder<M3UItem, M3UItem, QAfterSortBy> sortByEpisode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'episode', Sort.asc);
    });
  }

  QueryBuilder<M3UItem, M3UItem, QAfterSortBy> sortByEpisodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'episode', Sort.desc);
    });
  }

  QueryBuilder<M3UItem, M3UItem, QAfterSortBy> sortByGroupTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupTitle', Sort.asc);
    });
  }

  QueryBuilder<M3UItem, M3UItem, QAfterSortBy> sortByGroupTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupTitle', Sort.desc);
    });
  }

  QueryBuilder<M3UItem, M3UItem, QAfterSortBy> sortByLink() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'link', Sort.asc);
    });
  }

  QueryBuilder<M3UItem, M3UItem, QAfterSortBy> sortByLinkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'link', Sort.desc);
    });
  }

  QueryBuilder<M3UItem, M3UItem, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<M3UItem, M3UItem, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<M3UItem, M3UItem, QAfterSortBy> sortBySeason() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'season', Sort.asc);
    });
  }

  QueryBuilder<M3UItem, M3UItem, QAfterSortBy> sortBySeasonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'season', Sort.desc);
    });
  }

  QueryBuilder<M3UItem, M3UItem, QAfterSortBy> sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<M3UItem, M3UItem, QAfterSortBy> sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }
}

extension M3UItemQuerySortThenBy
    on QueryBuilder<M3UItem, M3UItem, QSortThenBy> {
  QueryBuilder<M3UItem, M3UItem, QAfterSortBy> thenByDuration() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'duration', Sort.asc);
    });
  }

  QueryBuilder<M3UItem, M3UItem, QAfterSortBy> thenByDurationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'duration', Sort.desc);
    });
  }

  QueryBuilder<M3UItem, M3UItem, QAfterSortBy> thenByEpisode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'episode', Sort.asc);
    });
  }

  QueryBuilder<M3UItem, M3UItem, QAfterSortBy> thenByEpisodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'episode', Sort.desc);
    });
  }

  QueryBuilder<M3UItem, M3UItem, QAfterSortBy> thenByGroupTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupTitle', Sort.asc);
    });
  }

  QueryBuilder<M3UItem, M3UItem, QAfterSortBy> thenByGroupTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupTitle', Sort.desc);
    });
  }

  QueryBuilder<M3UItem, M3UItem, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<M3UItem, M3UItem, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<M3UItem, M3UItem, QAfterSortBy> thenByLink() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'link', Sort.asc);
    });
  }

  QueryBuilder<M3UItem, M3UItem, QAfterSortBy> thenByLinkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'link', Sort.desc);
    });
  }

  QueryBuilder<M3UItem, M3UItem, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<M3UItem, M3UItem, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<M3UItem, M3UItem, QAfterSortBy> thenBySeason() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'season', Sort.asc);
    });
  }

  QueryBuilder<M3UItem, M3UItem, QAfterSortBy> thenBySeasonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'season', Sort.desc);
    });
  }

  QueryBuilder<M3UItem, M3UItem, QAfterSortBy> thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<M3UItem, M3UItem, QAfterSortBy> thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }
}

extension M3UItemQueryWhereDistinct
    on QueryBuilder<M3UItem, M3UItem, QDistinct> {
  QueryBuilder<M3UItem, M3UItem, QDistinct> distinctByDuration() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'duration');
    });
  }

  QueryBuilder<M3UItem, M3UItem, QDistinct> distinctByEpisode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'episode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<M3UItem, M3UItem, QDistinct> distinctByGroupTitle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'groupTitle', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<M3UItem, M3UItem, QDistinct> distinctByLink(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'link', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<M3UItem, M3UItem, QDistinct> distinctByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name');
    });
  }

  QueryBuilder<M3UItem, M3UItem, QDistinct> distinctBySeason(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'season', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<M3UItem, M3UItem, QDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }
}

extension M3UItemQueryProperty
    on QueryBuilder<M3UItem, M3UItem, QQueryProperty> {
  QueryBuilder<M3UItem, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<M3UItem, Attributes?, QQueryOperations> attributesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'attributes');
    });
  }

  QueryBuilder<M3UItem, int?, QQueryOperations> durationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'duration');
    });
  }

  QueryBuilder<M3UItem, String?, QQueryOperations> episodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'episode');
    });
  }

  QueryBuilder<M3UItem, String?, QQueryOperations> groupTitleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'groupTitle');
    });
  }

  QueryBuilder<M3UItem, String, QQueryOperations> linkProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'link');
    });
  }

  QueryBuilder<M3UItem, M3UType, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<M3UItem, String?, QQueryOperations> seasonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'season');
    });
  }

  QueryBuilder<M3UItem, String?, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const AttributesSchema = Schema(
  name: r'Attributes',
  id: -342725465051674545,
  properties: {
    r'groupTitle': PropertySchema(
      id: 0,
      name: r'groupTitle',
      type: IsarType.string,
    ),
    r'timeShift': PropertySchema(
      id: 1,
      name: r'timeShift',
      type: IsarType.string,
    ),
    r'tvgId': PropertySchema(
      id: 2,
      name: r'tvgId',
      type: IsarType.string,
    ),
    r'tvgLogo': PropertySchema(
      id: 3,
      name: r'tvgLogo',
      type: IsarType.string,
    ),
    r'tvgName': PropertySchema(
      id: 4,
      name: r'tvgName',
      type: IsarType.string,
    )
  },
  estimateSize: _attributesEstimateSize,
  serialize: _attributesSerialize,
  deserialize: _attributesDeserialize,
  deserializeProp: _attributesDeserializeProp,
);

int _attributesEstimateSize(
  Attributes object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.groupTitle;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.timeShift;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.tvgId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.tvgLogo;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.tvgName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _attributesSerialize(
  Attributes object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.groupTitle);
  writer.writeString(offsets[1], object.timeShift);
  writer.writeString(offsets[2], object.tvgId);
  writer.writeString(offsets[3], object.tvgLogo);
  writer.writeString(offsets[4], object.tvgName);
}

Attributes _attributesDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Attributes(
    groupTitle: reader.readStringOrNull(offsets[0]),
    timeShift: reader.readStringOrNull(offsets[1]),
    tvgId: reader.readStringOrNull(offsets[2]),
    tvgLogo: reader.readStringOrNull(offsets[3]),
    tvgName: reader.readStringOrNull(offsets[4]),
  );
  return object;
}

P _attributesDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension AttributesQueryFilter
    on QueryBuilder<Attributes, Attributes, QFilterCondition> {
  QueryBuilder<Attributes, Attributes, QAfterFilterCondition>
      groupTitleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'groupTitle',
      ));
    });
  }

  QueryBuilder<Attributes, Attributes, QAfterFilterCondition>
      groupTitleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'groupTitle',
      ));
    });
  }

  QueryBuilder<Attributes, Attributes, QAfterFilterCondition> groupTitleEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'groupTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Attributes, Attributes, QAfterFilterCondition>
      groupTitleGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'groupTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Attributes, Attributes, QAfterFilterCondition>
      groupTitleLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'groupTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Attributes, Attributes, QAfterFilterCondition> groupTitleBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'groupTitle',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Attributes, Attributes, QAfterFilterCondition>
      groupTitleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'groupTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Attributes, Attributes, QAfterFilterCondition>
      groupTitleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'groupTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Attributes, Attributes, QAfterFilterCondition>
      groupTitleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'groupTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Attributes, Attributes, QAfterFilterCondition> groupTitleMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'groupTitle',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Attributes, Attributes, QAfterFilterCondition>
      groupTitleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'groupTitle',
        value: '',
      ));
    });
  }

  QueryBuilder<Attributes, Attributes, QAfterFilterCondition>
      groupTitleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'groupTitle',
        value: '',
      ));
    });
  }

  QueryBuilder<Attributes, Attributes, QAfterFilterCondition>
      timeShiftIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'timeShift',
      ));
    });
  }

  QueryBuilder<Attributes, Attributes, QAfterFilterCondition>
      timeShiftIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'timeShift',
      ));
    });
  }

  QueryBuilder<Attributes, Attributes, QAfterFilterCondition> timeShiftEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timeShift',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Attributes, Attributes, QAfterFilterCondition>
      timeShiftGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'timeShift',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Attributes, Attributes, QAfterFilterCondition> timeShiftLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'timeShift',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Attributes, Attributes, QAfterFilterCondition> timeShiftBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'timeShift',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Attributes, Attributes, QAfterFilterCondition>
      timeShiftStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'timeShift',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Attributes, Attributes, QAfterFilterCondition> timeShiftEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'timeShift',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Attributes, Attributes, QAfterFilterCondition> timeShiftContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'timeShift',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Attributes, Attributes, QAfterFilterCondition> timeShiftMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'timeShift',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Attributes, Attributes, QAfterFilterCondition>
      timeShiftIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timeShift',
        value: '',
      ));
    });
  }

  QueryBuilder<Attributes, Attributes, QAfterFilterCondition>
      timeShiftIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'timeShift',
        value: '',
      ));
    });
  }

  QueryBuilder<Attributes, Attributes, QAfterFilterCondition> tvgIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'tvgId',
      ));
    });
  }

  QueryBuilder<Attributes, Attributes, QAfterFilterCondition> tvgIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'tvgId',
      ));
    });
  }

  QueryBuilder<Attributes, Attributes, QAfterFilterCondition> tvgIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tvgId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Attributes, Attributes, QAfterFilterCondition> tvgIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tvgId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Attributes, Attributes, QAfterFilterCondition> tvgIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tvgId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Attributes, Attributes, QAfterFilterCondition> tvgIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tvgId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Attributes, Attributes, QAfterFilterCondition> tvgIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'tvgId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Attributes, Attributes, QAfterFilterCondition> tvgIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'tvgId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Attributes, Attributes, QAfterFilterCondition> tvgIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tvgId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Attributes, Attributes, QAfterFilterCondition> tvgIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tvgId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Attributes, Attributes, QAfterFilterCondition> tvgIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tvgId',
        value: '',
      ));
    });
  }

  QueryBuilder<Attributes, Attributes, QAfterFilterCondition>
      tvgIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tvgId',
        value: '',
      ));
    });
  }

  QueryBuilder<Attributes, Attributes, QAfterFilterCondition> tvgLogoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'tvgLogo',
      ));
    });
  }

  QueryBuilder<Attributes, Attributes, QAfterFilterCondition>
      tvgLogoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'tvgLogo',
      ));
    });
  }

  QueryBuilder<Attributes, Attributes, QAfterFilterCondition> tvgLogoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tvgLogo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Attributes, Attributes, QAfterFilterCondition>
      tvgLogoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tvgLogo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Attributes, Attributes, QAfterFilterCondition> tvgLogoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tvgLogo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Attributes, Attributes, QAfterFilterCondition> tvgLogoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tvgLogo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Attributes, Attributes, QAfterFilterCondition> tvgLogoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'tvgLogo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Attributes, Attributes, QAfterFilterCondition> tvgLogoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'tvgLogo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Attributes, Attributes, QAfterFilterCondition> tvgLogoContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tvgLogo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Attributes, Attributes, QAfterFilterCondition> tvgLogoMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tvgLogo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Attributes, Attributes, QAfterFilterCondition> tvgLogoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tvgLogo',
        value: '',
      ));
    });
  }

  QueryBuilder<Attributes, Attributes, QAfterFilterCondition>
      tvgLogoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tvgLogo',
        value: '',
      ));
    });
  }

  QueryBuilder<Attributes, Attributes, QAfterFilterCondition> tvgNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'tvgName',
      ));
    });
  }

  QueryBuilder<Attributes, Attributes, QAfterFilterCondition>
      tvgNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'tvgName',
      ));
    });
  }

  QueryBuilder<Attributes, Attributes, QAfterFilterCondition> tvgNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tvgName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Attributes, Attributes, QAfterFilterCondition>
      tvgNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tvgName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Attributes, Attributes, QAfterFilterCondition> tvgNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tvgName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Attributes, Attributes, QAfterFilterCondition> tvgNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tvgName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Attributes, Attributes, QAfterFilterCondition> tvgNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'tvgName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Attributes, Attributes, QAfterFilterCondition> tvgNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'tvgName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Attributes, Attributes, QAfterFilterCondition> tvgNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tvgName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Attributes, Attributes, QAfterFilterCondition> tvgNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tvgName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Attributes, Attributes, QAfterFilterCondition> tvgNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tvgName',
        value: '',
      ));
    });
  }

  QueryBuilder<Attributes, Attributes, QAfterFilterCondition>
      tvgNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tvgName',
        value: '',
      ));
    });
  }
}

extension AttributesQueryObject
    on QueryBuilder<Attributes, Attributes, QFilterCondition> {}
