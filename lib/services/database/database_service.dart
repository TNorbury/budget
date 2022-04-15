import 'dart:async';

import 'package:budget/models/transaction/transaction.dart';
import 'package:budget/services/database/transaction_database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

final databaseServiceProvider = Provider<DatabaseService>((ref) {
  return DatabaseService();
});

final transactionDatabaseProvider = Provider<TransactionDatabase>((ref) {
  final db = ref.watch(databaseServiceProvider);

  return TransactionDatabase(db._isarCompleter );
});

class DatabaseService {
  late final Isar _isar;

  /// used so that any database sub-sections will have to wait before using
  /// the database
  final Completer<Isar> _isarCompleter = Completer();

  DatabaseService() {
    _init();
  }

  Future<void> _init() async {
    final dir = await getApplicationSupportDirectory();

    _isar = await Isar.open(
      schemas: [TransactionSchema],
      directory: dir.path,
    );

    _isarCompleter.complete(_isar);
  }
}
