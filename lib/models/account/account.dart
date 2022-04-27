import 'package:isar/isar.dart';

import 'package:budget/models/transaction/transaction.dart';

part 'account.g.dart';

@Collection()
class Account {
  @Id()
  final int accountId;

  final String bankOrg;

  final String nickName;

  // @Backlink(to: "account")
  final transactions = IsarLinks<Transaction>();

  Account({
    required this.accountId,
    required this.bankOrg,
    required this.nickName,
  });
}
