// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast

extension GetTransactionCollection on Isar {
  IsarCollection<Transaction> get transactions {
    return getCollection('Transaction');
  }
}

final TransactionSchema = CollectionSchema(
  name: 'Transaction',
  schema:
      '{"name":"Transaction","idName":"id","properties":[{"name":"amount","type":"Float"},{"name":"datePosted","type":"Long"},{"name":"memo","type":"String"},{"name":"name","type":"String"}],"indexes":[{"name":"datePosted","unique":false,"properties":[{"name":"datePosted","type":"Value","caseSensitive":false}]}],"links":[{"name":"account","target":"Account"}]}',
  nativeAdapter: const _TransactionNativeAdapter(),
  webAdapter: const _TransactionWebAdapter(),
  idName: 'id',
  propertyIds: {'amount': 0, 'datePosted': 1, 'memo': 2, 'name': 3},
  listProperties: {},
  indexIds: {'datePosted': 0},
  indexTypes: {
    'datePosted': [
      NativeIndexType.long,
    ]
  },
  linkIds: {'account': 0},
  backlinkIds: {},
  linkedCollections: ['Account'],
  getId: (obj) {
    if (obj.id == Isar.autoIncrement) {
      return null;
    } else {
      return obj.id;
    }
  },
  setId: null,
  getLinks: (obj) => [obj.account],
  version: 2,
);

class _TransactionWebAdapter extends IsarWebTypeAdapter<Transaction> {
  const _TransactionWebAdapter();

  @override
  Object serialize(IsarCollection<Transaction> collection, Transaction object) {
    final jsObj = IsarNative.newJsObject();
    IsarNative.jsObjectSet(jsObj, 'amount', object.amount);
    IsarNative.jsObjectSet(
        jsObj, 'datePosted', object.datePosted.toUtc().millisecondsSinceEpoch);
    IsarNative.jsObjectSet(jsObj, 'id', object.id);
    IsarNative.jsObjectSet(jsObj, 'memo', object.memo);
    IsarNative.jsObjectSet(jsObj, 'name', object.name);
    return jsObj;
  }

  @override
  Transaction deserialize(
      IsarCollection<Transaction> collection, dynamic jsObj) {
    final object = Transaction(
      amount:
          IsarNative.jsObjectGet(jsObj, 'amount') ?? double.negativeInfinity,
      datePosted: IsarNative.jsObjectGet(jsObj, 'datePosted') != null
          ? DateTime.fromMillisecondsSinceEpoch(
                  IsarNative.jsObjectGet(jsObj, 'datePosted'),
                  isUtc: true)
              .toLocal()
          : DateTime.fromMillisecondsSinceEpoch(0),
      memo: IsarNative.jsObjectGet(jsObj, 'memo') ?? '',
      name: IsarNative.jsObjectGet(jsObj, 'name') ?? '',
    );
    attachLinks(collection.isar,
        IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity, object);
    return object;
  }

  @override
  P deserializeProperty<P>(Object jsObj, String propertyName) {
    switch (propertyName) {
      case 'amount':
        return (IsarNative.jsObjectGet(jsObj, 'amount') ??
            double.negativeInfinity) as P;
      case 'datePosted':
        return (IsarNative.jsObjectGet(jsObj, 'datePosted') != null
            ? DateTime.fromMillisecondsSinceEpoch(
                    IsarNative.jsObjectGet(jsObj, 'datePosted'),
                    isUtc: true)
                .toLocal()
            : DateTime.fromMillisecondsSinceEpoch(0)) as P;
      case 'id':
        return (IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity)
            as P;
      case 'memo':
        return (IsarNative.jsObjectGet(jsObj, 'memo') ?? '') as P;
      case 'name':
        return (IsarNative.jsObjectGet(jsObj, 'name') ?? '') as P;
      default:
        throw 'Illegal propertyName';
    }
  }

  @override
  void attachLinks(Isar isar, int id, Transaction object) {
    object.account.attach(
      id,
      isar.transactions,
      isar.getCollection<Account>('Account'),
      'account',
      false,
    );
  }
}

class _TransactionNativeAdapter extends IsarNativeTypeAdapter<Transaction> {
  const _TransactionNativeAdapter();

  @override
  void serialize(
      IsarCollection<Transaction> collection,
      IsarRawObject rawObj,
      Transaction object,
      int staticSize,
      List<int> offsets,
      AdapterAlloc alloc) {
    var dynamicSize = 0;
    final value0 = object.amount;
    final _amount = value0;
    final value1 = object.datePosted;
    final _datePosted = value1;
    final value2 = object.memo;
    final _memo = IsarBinaryWriter.utf8Encoder.convert(value2);
    dynamicSize += (_memo.length) as int;
    final value3 = object.name;
    final _name = IsarBinaryWriter.utf8Encoder.convert(value3);
    dynamicSize += (_name.length) as int;
    final size = staticSize + dynamicSize;

    rawObj.buffer = alloc(size);
    rawObj.buffer_length = size;
    final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
    final writer = IsarBinaryWriter(buffer, staticSize);
    writer.writeFloat(offsets[0], _amount);
    writer.writeDateTime(offsets[1], _datePosted);
    writer.writeBytes(offsets[2], _memo);
    writer.writeBytes(offsets[3], _name);
  }

  @override
  Transaction deserialize(IsarCollection<Transaction> collection, int id,
      IsarBinaryReader reader, List<int> offsets) {
    final object = Transaction(
      amount: reader.readFloat(offsets[0]),
      datePosted: reader.readDateTime(offsets[1]),
      memo: reader.readString(offsets[2]),
      name: reader.readString(offsets[3]),
    );
    attachLinks(collection.isar, id, object);
    return object;
  }

  @override
  P deserializeProperty<P>(
      int id, IsarBinaryReader reader, int propertyIndex, int offset) {
    switch (propertyIndex) {
      case -1:
        return id as P;
      case 0:
        return (reader.readFloat(offset)) as P;
      case 1:
        return (reader.readDateTime(offset)) as P;
      case 2:
        return (reader.readString(offset)) as P;
      case 3:
        return (reader.readString(offset)) as P;
      default:
        throw 'Illegal propertyIndex';
    }
  }

  @override
  void attachLinks(Isar isar, int id, Transaction object) {
    object.account.attach(
      id,
      isar.transactions,
      isar.getCollection<Account>('Account'),
      'account',
      false,
    );
  }
}

extension TransactionQueryWhereSort
    on QueryBuilder<Transaction, Transaction, QWhere> {
  QueryBuilder<Transaction, Transaction, QAfterWhere> anyId() {
    return addWhereClauseInternal(const WhereClause(indexName: null));
  }

  QueryBuilder<Transaction, Transaction, QAfterWhere> anyDatePosted() {
    return addWhereClauseInternal(const WhereClause(indexName: 'datePosted'));
  }
}

extension TransactionQueryWhere
    on QueryBuilder<Transaction, Transaction, QWhereClause> {
  QueryBuilder<Transaction, Transaction, QAfterWhereClause> idEqualTo(int id) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [id],
      includeLower: true,
      upper: [id],
      includeUpper: true,
    ));
  }

  QueryBuilder<Transaction, Transaction, QAfterWhereClause> idNotEqualTo(
      int id) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(WhereClause(
        indexName: null,
        upper: [id],
        includeUpper: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: null,
        lower: [id],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(WhereClause(
        indexName: null,
        lower: [id],
        includeLower: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: null,
        upper: [id],
        includeUpper: false,
      ));
    }
  }

  QueryBuilder<Transaction, Transaction, QAfterWhereClause> idGreaterThan(
    int id, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [id],
      includeLower: include,
    ));
  }

  QueryBuilder<Transaction, Transaction, QAfterWhereClause> idLessThan(
    int id, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      upper: [id],
      includeUpper: include,
    ));
  }

  QueryBuilder<Transaction, Transaction, QAfterWhereClause> idBetween(
    int lowerId,
    int upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [lowerId],
      includeLower: includeLower,
      upper: [upperId],
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Transaction, Transaction, QAfterWhereClause> datePostedEqualTo(
      DateTime datePosted) {
    return addWhereClauseInternal(WhereClause(
      indexName: 'datePosted',
      lower: [datePosted],
      includeLower: true,
      upper: [datePosted],
      includeUpper: true,
    ));
  }

  QueryBuilder<Transaction, Transaction, QAfterWhereClause>
      datePostedNotEqualTo(DateTime datePosted) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(WhereClause(
        indexName: 'datePosted',
        upper: [datePosted],
        includeUpper: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: 'datePosted',
        lower: [datePosted],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(WhereClause(
        indexName: 'datePosted',
        lower: [datePosted],
        includeLower: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: 'datePosted',
        upper: [datePosted],
        includeUpper: false,
      ));
    }
  }

  QueryBuilder<Transaction, Transaction, QAfterWhereClause>
      datePostedGreaterThan(
    DateTime datePosted, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: 'datePosted',
      lower: [datePosted],
      includeLower: include,
    ));
  }

  QueryBuilder<Transaction, Transaction, QAfterWhereClause> datePostedLessThan(
    DateTime datePosted, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: 'datePosted',
      upper: [datePosted],
      includeUpper: include,
    ));
  }

  QueryBuilder<Transaction, Transaction, QAfterWhereClause> datePostedBetween(
    DateTime lowerDatePosted,
    DateTime upperDatePosted, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: 'datePosted',
      lower: [lowerDatePosted],
      includeLower: includeLower,
      upper: [upperDatePosted],
      includeUpper: includeUpper,
    ));
  }
}

extension TransactionQueryFilter
    on QueryBuilder<Transaction, Transaction, QFilterCondition> {
  QueryBuilder<Transaction, Transaction, QAfterFilterCondition>
      amountGreaterThan(double value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: false,
      property: 'amount',
      value: value,
    ));
  }

  QueryBuilder<Transaction, Transaction, QAfterFilterCondition> amountLessThan(
      double value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: false,
      property: 'amount',
      value: value,
    ));
  }

  QueryBuilder<Transaction, Transaction, QAfterFilterCondition> amountBetween(
      double lower, double upper) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'amount',
      lower: lower,
      includeLower: false,
      upper: upper,
      includeUpper: false,
    ));
  }

  QueryBuilder<Transaction, Transaction, QAfterFilterCondition>
      datePostedEqualTo(DateTime value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'datePosted',
      value: value,
    ));
  }

  QueryBuilder<Transaction, Transaction, QAfterFilterCondition>
      datePostedGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'datePosted',
      value: value,
    ));
  }

  QueryBuilder<Transaction, Transaction, QAfterFilterCondition>
      datePostedLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'datePosted',
      value: value,
    ));
  }

  QueryBuilder<Transaction, Transaction, QAfterFilterCondition>
      datePostedBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'datePosted',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Transaction, Transaction, QAfterFilterCondition> idEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Transaction, Transaction, QAfterFilterCondition> idGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Transaction, Transaction, QAfterFilterCondition> idLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Transaction, Transaction, QAfterFilterCondition> idBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'id',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Transaction, Transaction, QAfterFilterCondition> memoEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'memo',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Transaction, Transaction, QAfterFilterCondition> memoGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'memo',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Transaction, Transaction, QAfterFilterCondition> memoLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'memo',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Transaction, Transaction, QAfterFilterCondition> memoBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'memo',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Transaction, Transaction, QAfterFilterCondition> memoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'memo',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Transaction, Transaction, QAfterFilterCondition> memoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'memo',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Transaction, Transaction, QAfterFilterCondition> memoContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'memo',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Transaction, Transaction, QAfterFilterCondition> memoMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'memo',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Transaction, Transaction, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Transaction, Transaction, QAfterFilterCondition> nameGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Transaction, Transaction, QAfterFilterCondition> nameLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Transaction, Transaction, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'name',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Transaction, Transaction, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Transaction, Transaction, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Transaction, Transaction, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Transaction, Transaction, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'name',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }
}

extension TransactionQueryLinks
    on QueryBuilder<Transaction, Transaction, QFilterCondition> {
  QueryBuilder<Transaction, Transaction, QAfterFilterCondition> account(
      FilterQuery<Account> q) {
    return linkInternal(
      isar.accounts,
      q,
      'account',
    );
  }
}

extension TransactionQueryWhereSortBy
    on QueryBuilder<Transaction, Transaction, QSortBy> {
  QueryBuilder<Transaction, Transaction, QAfterSortBy> sortByAmount() {
    return addSortByInternal('amount', Sort.asc);
  }

  QueryBuilder<Transaction, Transaction, QAfterSortBy> sortByAmountDesc() {
    return addSortByInternal('amount', Sort.desc);
  }

  QueryBuilder<Transaction, Transaction, QAfterSortBy> sortByDatePosted() {
    return addSortByInternal('datePosted', Sort.asc);
  }

  QueryBuilder<Transaction, Transaction, QAfterSortBy> sortByDatePostedDesc() {
    return addSortByInternal('datePosted', Sort.desc);
  }

  QueryBuilder<Transaction, Transaction, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Transaction, Transaction, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Transaction, Transaction, QAfterSortBy> sortByMemo() {
    return addSortByInternal('memo', Sort.asc);
  }

  QueryBuilder<Transaction, Transaction, QAfterSortBy> sortByMemoDesc() {
    return addSortByInternal('memo', Sort.desc);
  }

  QueryBuilder<Transaction, Transaction, QAfterSortBy> sortByName() {
    return addSortByInternal('name', Sort.asc);
  }

  QueryBuilder<Transaction, Transaction, QAfterSortBy> sortByNameDesc() {
    return addSortByInternal('name', Sort.desc);
  }
}

extension TransactionQueryWhereSortThenBy
    on QueryBuilder<Transaction, Transaction, QSortThenBy> {
  QueryBuilder<Transaction, Transaction, QAfterSortBy> thenByAmount() {
    return addSortByInternal('amount', Sort.asc);
  }

  QueryBuilder<Transaction, Transaction, QAfterSortBy> thenByAmountDesc() {
    return addSortByInternal('amount', Sort.desc);
  }

  QueryBuilder<Transaction, Transaction, QAfterSortBy> thenByDatePosted() {
    return addSortByInternal('datePosted', Sort.asc);
  }

  QueryBuilder<Transaction, Transaction, QAfterSortBy> thenByDatePostedDesc() {
    return addSortByInternal('datePosted', Sort.desc);
  }

  QueryBuilder<Transaction, Transaction, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Transaction, Transaction, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Transaction, Transaction, QAfterSortBy> thenByMemo() {
    return addSortByInternal('memo', Sort.asc);
  }

  QueryBuilder<Transaction, Transaction, QAfterSortBy> thenByMemoDesc() {
    return addSortByInternal('memo', Sort.desc);
  }

  QueryBuilder<Transaction, Transaction, QAfterSortBy> thenByName() {
    return addSortByInternal('name', Sort.asc);
  }

  QueryBuilder<Transaction, Transaction, QAfterSortBy> thenByNameDesc() {
    return addSortByInternal('name', Sort.desc);
  }
}

extension TransactionQueryWhereDistinct
    on QueryBuilder<Transaction, Transaction, QDistinct> {
  QueryBuilder<Transaction, Transaction, QDistinct> distinctByAmount() {
    return addDistinctByInternal('amount');
  }

  QueryBuilder<Transaction, Transaction, QDistinct> distinctByDatePosted() {
    return addDistinctByInternal('datePosted');
  }

  QueryBuilder<Transaction, Transaction, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<Transaction, Transaction, QDistinct> distinctByMemo(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('memo', caseSensitive: caseSensitive);
  }

  QueryBuilder<Transaction, Transaction, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('name', caseSensitive: caseSensitive);
  }
}

extension TransactionQueryProperty
    on QueryBuilder<Transaction, Transaction, QQueryProperty> {
  QueryBuilder<Transaction, double, QQueryOperations> amountProperty() {
    return addPropertyNameInternal('amount');
  }

  QueryBuilder<Transaction, DateTime, QQueryOperations> datePostedProperty() {
    return addPropertyNameInternal('datePosted');
  }

  QueryBuilder<Transaction, int, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<Transaction, String, QQueryOperations> memoProperty() {
    return addPropertyNameInternal('memo');
  }

  QueryBuilder<Transaction, String, QQueryOperations> nameProperty() {
    return addPropertyNameInternal('name');
  }
}
