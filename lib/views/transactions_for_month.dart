import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:budget/models/month.dart';
import 'package:budget/models/transaction/transaction.dart';
import 'package:budget/services/database/database_service.dart';
import 'package:budget/theme/lib_color_schemes.g.dart';
import 'package:budget/utils/month_from_int.dart';
import 'package:budget/widgets/transaction_tile.dart';

class TransactionsForMonth extends ConsumerStatefulWidget {
  final void Function(Transaction transaction) onTransactionSelected;
  const TransactionsForMonth({
    Key? key,
    required this.onTransactionSelected,
  }) : super(key: key);

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
          child: Column(
            children: [
              Row(
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
                    icon: const Icon(Icons.calendar_today),
                  )
                ],
              ),

              _TotalsForMonth(month: currentMonth),
              _TotalsForMonth(month: currentMonth, expenses: false,),
            ],
          ),
        ),
        Expanded(
          child: FutureBuilder<List<Transaction>>(
            future: _transactionsFuture,
            // initialData: const [],
            builder: (context, snapshot) {
              if (snapshot.data == null) {
                return const CircularProgressIndicator();
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
                      onTap: () {
                        widget.onTransactionSelected(transaction);
                      },
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

class _TotalsForMonth extends ConsumerStatefulWidget {
  final Month month;
  final bool expenses;
  const _TotalsForMonth({
    Key? key,
    required this.month,
    this.expenses = true,
  }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ExpensesForMonthState();
}

class _ExpensesForMonthState extends ConsumerState<_TotalsForMonth> {
  late Future<double> _totalsFuture;

  StreamSubscription? _watchStreamSub;


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

  @override
  void didUpdateWidget(covariant _TotalsForMonth oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.month != widget.month) {
      _loadTransactions();
    }
  }

  void _loadTransactions() {
    setState(() {
      if (widget.expenses) {
        _totalsFuture = ref
            .read(transactionDatabaseProvider)
            .getExpensesForMonth(month: widget.month);
      } else {
        _totalsFuture = ref
            .read(transactionDatabaseProvider)
            .getIncomeForMonth(month: widget.month);

      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<double>(
      future: _totalsFuture,
      builder: (BuildContext context, snapshot) {
        if (!snapshot.hasData) {
          return CircularProgressIndicator();
        }
        String label = widget.expenses ? "Total Expenses" : "Total Income";
        return Text("$label: ${snapshot.data!.toStringAsFixed(2)}");
      },
    );
  }
}
