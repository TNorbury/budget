import 'package:isar/isar.dart';

import 'package:budget/models/account/account.dart';
import 'package:budget/models/category/category.dart';

part "transaction.g.dart";

@Collection()
class Transaction {
  @Id()
  final int id = Isar.autoIncrement;

  /// The name of the transactions
  final String name;

  /// Memo of this transaction
  final String memo;

  /// The amount of this transaction
  @Size32()
  final double amount;

  /// When the transaction posted to the banking service
  @Index()
  final DateTime datePosted;

  @Index(unique: true)
  final String fitId;

  final account = IsarLink<Account>();

  final category = IsarLink<Category>();

  Transaction({
    required this.name,
    required this.memo,
    required this.amount,
    required this.datePosted,
    required this.fitId,
  });

  Transaction copyWith({
    String? name,
    String? memo,
    double? amount,
    DateTime? datePosted,
    Account? account,
    String? fitId,
  }) {
    final t = Transaction(
      name: name ?? this.name,
      memo: memo ?? this.memo,
      amount: amount ?? this.amount,
      datePosted: datePosted ?? this.datePosted,
      fitId: fitId ?? this.fitId,
    )..account.value = account ?? this.account.value;

    return t;
  }
}
