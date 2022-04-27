import 'dart:async';

import 'package:budget/theme/lib_color_schemes.g.dart';
import 'package:budget/utils/month_from_int.dart';
import 'package:budget/widgets/transaction_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:budget/models/month.dart';
import 'package:budget/models/transaction/transaction.dart';
import 'package:budget/services/database/database_service.dart';

class TransactionsForMonth extends ConsumerStatefulWidget {
  const TransactionsForMonth({Key? key}) : super(key: key);

  @override
  ConsumerState<TransactionsForMonth> createState() =>
      _TransactionsForMonthState();
}

class _TransactionsForMonthState extends ConsumerState<TransactionsForMonth> {
  late Future<List<Transaction>> _transactionsFuture;

  StreamSubscription? _watchStreamSub;

  Month currentMonth = Month.fromDateTime(DateTime.now());

  @override
  void initState() {
    super.initState();

    _loadTransactions();

    ref.read(transactionDatabaseProvider).watchTransactions().then(
          (value) => _watchStreamSub = value.listen((event) {
            _loadTransactions();
          }),
        );
  }

  @override
  void dispose() {
    _watchStreamSub?.cancel();

    super.dispose();
  }

  void _loadTransactions() {
    setState(() {
      _transactionsFuture = ref
          .read(transactionDatabaseProvider)
          .getTransactionsForMonth(month: currentMonth);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceVariant),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.keyboard_arrow_left,
                        color: lightColorScheme.onSurfaceVariant,
                      ),
                      onPressed: () {
                        setState(() {
                          currentMonth = Month(
                              year: currentMonth.year,
                              month: currentMonth.month - 1);
                          _loadTransactions();
                        });
                      },
                    ),
                    Flexible(
                      child: Text(
                        "Transactions for ${monthFromInt(currentMonth.month)} ${currentMonth.year}",
                        style: Theme.of(context).textTheme.headlineLarge?.merge(
                            TextStyle(
                                color: lightColorScheme.onSurfaceVariant)),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.keyboard_arrow_right,
                        color: lightColorScheme.onSurfaceVariant,
                      ),
                      onPressed: () {
                        setState(() {
                          currentMonth = Month(
                              year: currentMonth.year,
                              month: currentMonth.month + 1);
                          _loadTransactions();
                        });
                      },
                    ),
                  ],
                ),
              ),

              // if (currentMonth != )
              IconButton(
                onPressed: () {
                  setState(() {
                    currentMonth = Month.fromDateTime(DateTime.now());
                    _loadTransactions();
                  });
                },
                icon: Icon(Icons.calendar_today),
              )
            ],
          ),
        ),
        Expanded(
          child: FutureBuilder<List<Transaction>>(
            future: _transactionsFuture,
            // initialData: const [],
            builder: (context, snapshot) {
              if (snapshot.data == null) {
                return CircularProgressIndicator();
              }

              List<Transaction> transactions = snapshot.data ?? [];

              return Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).colorScheme.outline,
                  ),
                ),
                child: ListView.separated(
                  itemCount: transactions.length,
                  itemBuilder: (context, index) {
                    final transaction = transactions[index];
                    return TransactionTile(
                      transaction: transaction,
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider(
                      height: 1,
                      color: Theme.of(context).colorScheme.outline,
                    );
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
