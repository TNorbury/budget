import 'dart:async';

import 'package:budget/models/account/account.dart';
import 'package:isar/isar.dart';

class AccountDatabase {
  /// Completer for the Isar reference,
  final Completer<Isar> _isarCompleter;

  AccountDatabase(
    this._isarCompleter,
  );

  Future<void> addAccount(Account account) async {
    final isar = await _isarCompleter.future;

    await isar.writeTxn((isar) async => await isar.accounts.put(account));
  }

  /// Returns the account for the given id, or null if it doesn't exist
  Future<Account?> getAccount(int accountId) async {
    final isar = await _isarCompleter.future;

    return isar.accounts.getSync(accountId);
  }
}
