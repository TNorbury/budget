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

    if (accountFromDb == null) {
      await _read(accountDatabaseProvider)
          .addAccount(transactions.first.account.value!);
      accountFromDb = await _read(accountDatabaseProvider)
          .getAccount(transactions.first.account.value!.accountId);
    }

    await isar.writeTxn(
      (isar) async {
        // final account = accountCache.

        for (final transaction in transactions) {
          bool duplicateTransaction = await containsTransaction(transaction);
          if (duplicateTransaction) {
            continue;
          }

          await isar.transactions.put(
            transaction.copyWith(account: accountFromDb),
            saveLinks: true,
          );

          // await transaction.account.save();
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

  /// Returns true if an equal transaction is already in the database
  Future<bool> containsTransaction(Transaction transaction) async {
    final Isar isar = await _isarCompleter.future;

    return (await isar.transactions
            .filter()
            .datePostedEqualTo(transaction.datePosted)
            .and()
            .nameEqualTo(transaction.name)
            .and()
            .memoEqualTo(transaction.memo)
            .and()
            .group((q) => q
                .not()
                .amountGreaterThan(transaction.amount)
                .and()
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
        .datePostedBetween(
          DateTime(month.year, month.month),
          DateTime(month.year, month.month + 1),
          includeLower: true,
          includeUpper: false,
        )
        .sortByDatePostedDesc()
        .findAll();
  }

  Future<double> getExpensesForMonth({required Month month}) async {
    final Isar isar = await _isarCompleter.future;

    return (await isar.transactions
            .filter()
            .datePostedBetween(
              DateTime(month.year, month.month),
              DateTime(month.year, month.month + 1),
              includeLower: true,
              includeUpper: false,
            )
            .amountLessThan(0)
            .findAll())
        .fold<double>(
            0, (runningSum, transaction) => runningSum + transaction.amount);
  }

  Future<double> getIncomeForMonth({required Month month}) async {
    final Isar isar = await _isarCompleter.future;

    return (await isar.transactions
            .filter()
            .datePostedBetween(
              DateTime(month.year, month.month),
              DateTime(month.year, month.month + 1),
              includeLower: true,
              includeUpper: false,
            )
            .amountGreaterThan(0)
            .findAll())
        .fold<double>(
            0, (runningSum, transaction) => runningSum + transaction.amount);
  }
}
