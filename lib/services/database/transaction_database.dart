import 'dart:async';

import 'package:budget/models/month.dart';
import 'package:budget/models/transaction/transaction.dart';
import 'package:isar/isar.dart';

/// Handler for the transaction portion of the database
class TransactionDatabase {
  /// Completer for the Isar reference,
  final Completer<Isar> _isarCompleter;

  TransactionDatabase(this._isarCompleter);

  /// Adds a list a of transactions to the database
  Future<void> addTransactions(List<Transaction> transactions) async {
    final Isar isar = await _isarCompleter.future;

    await isar.writeTxn(
      (isar) async {
        for (final transaction in transactions) {
          await isar.transactions.put(transaction);
        }
      },
    );
  }

  /// Returns a stream which notifies whenever the transactions collection
  /// changes
  Future<Stream<void>> watchTransactions() async {
    final Isar isar = await _isarCompleter.future;

    return isar.transactions.watchLazy();
  }

  Future<List<Transaction>> getTransactions({int limit = 20}) async {
    final Isar isar = await _isarCompleter.future;
    return await isar.transactions
        .filter()
        .datePostedGreaterThan(DateTime(2022))
        .sortByDatePosted()
        .limit(limit)
        .findAll();
  }

  /// Returns true if an equal transaction is already in the database
  Future<bool> containsTransaction(Transaction transaction) async {
    final Isar isar = await _isarCompleter.future;

    return (await isar.transactions
            .filter()
            .datePostedEqualTo(transaction.datePosted)
            .nameEqualTo(transaction.name)
            .memoEqualTo(transaction.memo)
            .group((q) => q
                .not()
                .amountGreaterThan(transaction.amount)
                .not()
                .amountLessThan(transaction.amount))
            .count()) !=
        0;
  }

  /// Gets all the transactions for a given month (within a year))
  Future<List<Transaction>> getTransactionsForMonth(
      {required Month month}) async {
    final Isar isar = await _isarCompleter.future;

    return isar.transactions
        .filter()
        .datePostedGreaterThan(DateTime(month.year, month.month), include: true)
        .sortByDatePosted()
        .findAll();
  }
}
