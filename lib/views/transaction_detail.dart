import 'package:budget/services/database/database_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:budget/models/transaction/transaction.dart';
import 'package:budget/services/database/transaction_database.dart';
import 'package:budget/theme/lib_color_schemes.g.dart';

class TransactionDetail extends ConsumerWidget {
  final Transaction transaction;
  final VoidCallback onClose;
  const TransactionDetail({
    Key? key,
    required this.transaction,
    required this.onClose,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceVariant),
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Transaction Info",
                style: Theme.of(context).textTheme.titleLarge?.merge(
                    TextStyle(color: lightColorScheme.onSurfaceVariant)),
              ),
              IconButton(
                  onPressed: () {
                    onClose();
                  },
                  icon: const Icon(Icons.close))
            ],
          ),
        ),
        ref.watch(transactionStreamProvider(transaction)).when(
              data: (txn) => Text(txn?.name ?? "N/A"),
              error: (e, st) {
                throw e;
                // return const Text("Error");
              },
              loading: () => const CircularProgressIndicator(),
            ),
        ButtonBar(
          children: [
            ElevatedButton(
              child: Text("Delete"),
              onPressed: () async {
                await ref.read(transactionDatabaseProvider).deleteTransaction(transaction);
                onClose();
              },
            ),
          ],
        )
      ],
    );
  }
}
