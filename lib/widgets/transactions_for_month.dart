import 'package:budget/models/month.dart';
import 'package:budget/models/transaction/transaction.dart';
import 'package:budget/services/database/database_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TransactionsForMonth extends ConsumerStatefulWidget {
  const TransactionsForMonth({Key? key}) : super(key: key);

  @override
  ConsumerState<TransactionsForMonth> createState() =>
      _TransactionsForMonthState();
}

class _TransactionsForMonthState extends ConsumerState<TransactionsForMonth> {
  late Future<List<Transaction>> _transactionsFuture;

  @override
  void initState() {
    super.initState();

    _transactionsFuture = ref
        .read(transactionDatabaseProvider)
        .getTransactionsForMonth(month: Month.fromDateTime(DateTime.now()));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Transaction>>(
      future: _transactionsFuture,
      initialData: const [],
      builder: (context, snapshot) {
        List<Transaction> transactions = snapshot.data ?? [];

        return ListView.builder(
          itemCount: transactions.length,
          itemBuilder: (context, index) {
            final transaction = transactions[index];
            return ListTile(
              title: Text(transaction.name),
              trailing: Text(transaction.amount.toStringAsFixed(2)),
            );
          },
        );
      },
    );
  }
}
