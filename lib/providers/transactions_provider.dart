import 'dart:async';

import 'package:budget/models/month.dart';
import 'package:budget/models/transaction/transaction.dart';
import 'package:budget/services/database/database_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final transactionsProvider =
    StateNotifierProvider<TransactionsNotifier, List<Transaction>>((ref) {
  return TransactionsNotifier();
});

// final transactionsForMonthProvider = StateNotifierProvider.autoDispose.family<
//     TransactionsNotifier, List<Transaction>, Month>(
//   (ref, month) {
//     final TransactionsNotifier transactionsNotifier = TransactionsNotifier();

//     // get the current transactions for the month
//     ref
//         .watch(transactionDatabaseProvider)
//         .getTransactionsForMonth(month: month)
//         .then(
//           (value) => transactionsNotifier._transactions = value,
//         );

//     StreamSubscription<void>? watchSub;

//     ref.watch(transactionDatabaseProvider).watchTransactions().then(
//           (value) => watchSub = value.listen(
//             (event) {
//               ref
//                   .watch(transactionDatabaseProvider)
//                   .getTransactionsForMonth(month: month)
//                   .then(
//                     (value) => transactionsNotifier._transactions = value,
//                   );
//             },
//           ),
//         );

//     ref.onDispose(() {
//       watchSub?.cancel();
//     });

//     return transactionsNotifier;
//   },
// );

class TransactionsNotifier extends StateNotifier<List<Transaction>> {
  TransactionsNotifier() : super([]);

  set _transactions(List<Transaction> transactions) => state = transactions;
}
