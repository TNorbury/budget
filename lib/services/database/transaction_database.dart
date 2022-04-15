import 'dart:async';

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

  Future<List<Transaction>> getTransactions() async {
    final Isar isar = await _isarCompleter.future;
    return await isar.transactions
        .filter()
        .datePostedGreaterThan(DateTime(2022))
        .sortByDatePosted()
        .findAll();
  }
}
