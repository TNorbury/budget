import 'dart:async';

import 'package:budget/models/account/account.dart';
import 'package:budget/models/month.dart';
import 'package:budget/models/transaction/transaction.dart';
import 'package:budget/services/database/database_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

/// Handler for the transaction portion of the database
class TransactionDatabase {
  /// Completer for the Isar reference,
  final Completer<Isar> _isarCompleter;
  final Reader _read;

  TransactionDatabase(this._isarCompleter, this._read);

  /// Adds a list a of transactions to the database
  Future<void> addTransactions(List<Transaction> transactions) async {
    final Isar isar = await _isarCompleter.future;

    Account? accountFromDb = await _read(accountDatabaseProvider)
        .getAccount(transactions.first.account.value!.accountId);

    await isar.writeTxn(
      (isar) async {
        // final account = accountCache.

        for (final transaction in transactions) {
          await isar.transactions.put(
            transaction.copyWith(account: accountFromDb),
            saveLinks: true,
          );
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
        .sortByDatePostedDesc()
        .findAll();
  }
}
