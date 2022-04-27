import 'package:budget/models/transaction/transaction.dart';
import 'package:budget/views/transaction_detail.dart';
import 'package:budget/views/transactions_for_month.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Provides an overview of the users transactions, including all the
/// transactions for a month, and an optional view for editing transaction info
class TransactionsOverview extends ConsumerStatefulWidget {
  const TransactionsOverview({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TransactionsOverviewState();
}

class _TransactionsOverviewState extends ConsumerState<TransactionsOverview> {
  Transaction? _selectedTransaction;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          child: TransactionsForMonth(
            onTransactionSelected: (Transaction transaction) {
              setState(() {
                _selectedTransaction = transaction;
              });
            },
          ),
        ),
        if (_selectedTransaction != null)
          Flexible(
            child: TransactionDetail(
              transaction: _selectedTransaction!,
              onClose: () {
                setState(() {
                  _selectedTransaction = null;
                });
              },
            ),
          )
      ],
    );
  }
}
