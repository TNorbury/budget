import 'package:isar/isar.dart';

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

  final String bankOrg;

  final String accountId;

  Transaction({
    required this.name,
    required this.memo,
    required this.amount,
    required this.datePosted,
    required this.bankOrg,
    required this.accountId,
  });
}
