// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetAccountCollection on Isar {
  IsarCollection<Account> get accounts => getCollection();
}

const AccountSchema = CollectionSchema(
  name: 'Account',
  schema:
      '{"name":"Account","idName":"accountId","properties":[{"name":"bankOrg","type":"String"},{"name":"nickName","type":"String"}],"indexes":[],"links":[{"name":"transactions","target":"Transaction"}]}',
  idName: 'accountId',
  propertyIds: {'bankOrg': 0, 'nickName': 1},
  listProperties: {},
  indexIds: {},
  indexValueTypes: {},
  linkIds: {'transactions': 0},
  backlinkLinkNames: {},
  getId: _accountGetId,
  getLinks: _accountGetLinks,
  attachLinks: _accountAttachLinks,
  serializeNative: _accountSerializeNative,
  deserializeNative: _accountDeserializeNative,
  deserializePropNative: _accountDeserializePropNative,
  serializeWeb: _accountSerializeWeb,
  deserializeWeb: _accountDeserializeWeb,
  deserializePropWeb: _accountDeserializePropWeb,
  version: 3,
);

int? _accountGetId(Account object) {
  if (object.accountId == Isar.autoIncrement) {
    return null;
  } else {
    return object.accountId;
  }
}

List<IsarLinkBase> _accountGetLinks(Account object) {
  return [object.transactions];
}

void _accountSerializeNative(
    IsarCollection<Account> collection,
    IsarRawObject rawObj,
    Account object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.bankOrg;
  final _bankOrg = IsarBinaryWriter.utf8Encoder.convert(value0);
  dynamicSize += (_bankOrg.length) as int;
  final value1 = object.nickName;
  final _nickName = IsarBinaryWriter.utf8Encoder.convert(value1);
  dynamicSize += (_nickName.length) as int;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeBytes(offsets[0], _bankOrg);
  writer.writeBytes(offsets[1], _nickName);
}

Account _accountDeserializeNative(IsarCollection<Account> collection, int id,
    IsarBinaryReader reader, List<int> offsets) {
  final object = Account(
    accountId: id,
    bankOrg: reader.readString(offsets[0]),
    nickName: reader.readString(offsets[1]),
  );
  _accountAttachLinks(collection, id, object);
  return object;
}

P _accountDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _accountSerializeWeb(
    IsarCollection<Account> collection, Account object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'accountId', object.accountId);
  IsarNative.jsObjectSet(jsObj, 'bankOrg', object.bankOrg);
  IsarNative.jsObjectSet(jsObj, 'nickName', object.nickName);
  return jsObj;
}

Account _accountDeserializeWeb(
    IsarCollection<Account> collection, dynamic jsObj) {
  final object = Account(
    accountId:
        IsarNative.jsObjectGet(jsObj, 'accountId') ?? double.negativeInfinity,
    bankOrg: IsarNative.jsObjectGet(jsObj, 'bankOrg') ?? '',
    nickName: IsarNative.jsObjectGet(jsObj, 'nickName') ?? '',
  );
  _accountAttachLinks(
      collection,
      IsarNative.jsObjectGet(jsObj, 'accountId') ?? double.negativeInfinity,
      object);
  return object;
}

P _accountDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'accountId':
      return (IsarNative.jsObjectGet(jsObj, 'accountId') ??
          double.negativeInfinity) as P;
    case 'bankOrg':
      return (IsarNative.jsObjectGet(jsObj, 'bankOrg') ?? '') as P;
    case 'nickName':
      return (IsarNative.jsObjectGet(jsObj, 'nickName') ?? '') as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _accountAttachLinks(IsarCollection col, int id, Account object) {
  object.transactions.attach(col, col.isar.transactions, 'transactions', id);
}

extension AccountQueryWhereSort on QueryBuilder<Account, Account, QWhere> {
  QueryBuilder<Account, Account, QAfterWhere> anyAccountId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }
}

extension AccountQueryWhere on QueryBuilder<Account, Account, QWhereClause> {
  QueryBuilder<Account, Account, QAfterWhereClause> accountIdEqualTo(
      int accountId) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: accountId,
      includeLower: true,
      upper: accountId,
      includeUpper: true,
    ));
  }

  QueryBuilder<Account, Account, QAfterWhereClause> accountIdNotEqualTo(
      int accountId) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(
        IdWhereClause.lessThan(upper: accountId, includeUpper: false),
      ).addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: accountId, includeLower: false),
      );
    } else {
      return addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: accountId, includeLower: false),
      ).addWhereClauseInternal(
        IdWhereClause.lessThan(upper: accountId, includeUpper: false),
      );
    }
  }

  QueryBuilder<Account, Account, QAfterWhereClause> accountIdGreaterThan(
      int accountId,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: accountId, includeLower: include),
    );
  }

  QueryBuilder<Account, Account, QAfterWhereClause> accountIdLessThan(
      int accountId,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: accountId, includeUpper: include),
    );
  }

  QueryBuilder<Account, Account, QAfterWhereClause> accountIdBetween(
    int lowerAccountId,
    int upperAccountId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: lowerAccountId,
      includeLower: includeLower,
      upper: upperAccountId,
      includeUpper: includeUpper,
    ));
  }
}

extension AccountQueryFilter
    on QueryBuilder<Account, Account, QFilterCondition> {
  QueryBuilder<Account, Account, QAfterFilterCondition> accountIdEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'accountId',
      value: value,
    ));
  }

  QueryBuilder<Account, Account, QAfterFilterCondition> accountIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'accountId',
      value: value,
    ));
  }

  QueryBuilder<Account, Account, QAfterFilterCondition> accountIdLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'accountId',
      value: value,
    ));
  }

  QueryBuilder<Account, Account, QAfterFilterCondition> accountIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'accountId',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Account, Account, QAfterFilterCondition> bankOrgEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'bankOrg',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Account, Account, QAfterFilterCondition> bankOrgGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'bankOrg',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Account, Account, QAfterFilterCondition> bankOrgLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'bankOrg',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Account, Account, QAfterFilterCondition> bankOrgBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'bankOrg',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Account, Account, QAfterFilterCondition> bankOrgStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'bankOrg',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Account, Account, QAfterFilterCondition> bankOrgEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'bankOrg',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Account, Account, QAfterFilterCondition> bankOrgContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'bankOrg',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Account, Account, QAfterFilterCondition> bankOrgMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'bankOrg',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Account, Account, QAfterFilterCondition> nickNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'nickName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Account, Account, QAfterFilterCondition> nickNameGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'nickName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Account, Account, QAfterFilterCondition> nickNameLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'nickName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Account, Account, QAfterFilterCondition> nickNameBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'nickName',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Account, Account, QAfterFilterCondition> nickNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'nickName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Account, Account, QAfterFilterCondition> nickNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'nickName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Account, Account, QAfterFilterCondition> nickNameContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'nickName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Account, Account, QAfterFilterCondition> nickNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'nickName',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }
}

extension AccountQueryLinks
    on QueryBuilder<Account, Account, QFilterCondition> {
  QueryBuilder<Account, Account, QAfterFilterCondition> transactions(
      FilterQuery<Transaction> q) {
    return linkInternal(
      isar.transactions,
      q,
      'transactions',
    );
  }
}

extension AccountQueryWhereSortBy on QueryBuilder<Account, Account, QSortBy> {
  QueryBuilder<Account, Account, QAfterSortBy> sortByAccountId() {
    return addSortByInternal('accountId', Sort.asc);
  }

  QueryBuilder<Account, Account, QAfterSortBy> sortByAccountIdDesc() {
    return addSortByInternal('accountId', Sort.desc);
  }

  QueryBuilder<Account, Account, QAfterSortBy> sortByBankOrg() {
    return addSortByInternal('bankOrg', Sort.asc);
  }

  QueryBuilder<Account, Account, QAfterSortBy> sortByBankOrgDesc() {
    return addSortByInternal('bankOrg', Sort.desc);
  }

  QueryBuilder<Account, Account, QAfterSortBy> sortByNickName() {
    return addSortByInternal('nickName', Sort.asc);
  }

  QueryBuilder<Account, Account, QAfterSortBy> sortByNickNameDesc() {
    return addSortByInternal('nickName', Sort.desc);
  }
}

extension AccountQueryWhereSortThenBy
    on QueryBuilder<Account, Account, QSortThenBy> {
  QueryBuilder<Account, Account, QAfterSortBy> thenByAccountId() {
    return addSortByInternal('accountId', Sort.asc);
  }

  QueryBuilder<Account, Account, QAfterSortBy> thenByAccountIdDesc() {
    return addSortByInternal('accountId', Sort.desc);
  }

  QueryBuilder<Account, Account, QAfterSortBy> thenByBankOrg() {
    return addSortByInternal('bankOrg', Sort.asc);
  }

  QueryBuilder<Account, Account, QAfterSortBy> thenByBankOrgDesc() {
    return addSortByInternal('bankOrg', Sort.desc);
  }

  QueryBuilder<Account, Account, QAfterSortBy> thenByNickName() {
    return addSortByInternal('nickName', Sort.asc);
  }

  QueryBuilder<Account, Account, QAfterSortBy> thenByNickNameDesc() {
    return addSortByInternal('nickName', Sort.desc);
  }
}

extension AccountQueryWhereDistinct
    on QueryBuilder<Account, Account, QDistinct> {
  QueryBuilder<Account, Account, QDistinct> distinctByAccountId() {
    return addDistinctByInternal('accountId');
  }

  QueryBuilder<Account, Account, QDistinct> distinctByBankOrg(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('bankOrg', caseSensitive: caseSensitive);
  }

  QueryBuilder<Account, Account, QDistinct> distinctByNickName(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('nickName', caseSensitive: caseSensitive);
  }
}

extension AccountQueryProperty
    on QueryBuilder<Account, Account, QQueryProperty> {
  QueryBuilder<Account, int, QQueryOperations> accountIdProperty() {
    return addPropertyNameInternal('accountId');
  }

  QueryBuilder<Account, String, QQueryOperations> bankOrgProperty() {
    return addPropertyNameInternal('bankOrg');
  }

  QueryBuilder<Account, String, QQueryOperations> nickNameProperty() {
    return addPropertyNameInternal('nickName');
  }
}
