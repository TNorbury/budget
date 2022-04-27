
import 'package:flutter/material.dart';

import 'package:budget/models/transaction/transaction.dart';

class TransactionTile extends StatelessWidget {
  final Transaction transaction;
  final VoidCallback onTap;
  const TransactionTile({
    Key? key,
    required this.transaction,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DateTime datePosted = transaction.datePosted;
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(color: Theme.of(context).colorScheme.surface),
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(transaction.memo,
                      style: Theme.of(context).textTheme.bodyMedium),
                ),
                AmountText(amount: transaction.amount),
              ],
            ),
            Row(
              children: [
                Text(
                  "${datePosted.month}/${datePosted.day}/${datePosted.year}",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                // Text(
                //   "${transaction.id}",
                //   style: Theme.of(context).textTheme.bodySmall,
                // ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class AmountText extends StatelessWidget {
  const AmountText({
    Key? key,
    required this.amount,
  }) : super(key: key);

  final double amount;

  @override
  Widget build(BuildContext context) {
    final Color color = amount >= 0 ? Colors.green : Colors.red;

    return Text(
      amount.toStringAsFixed(2),
      style: Theme.of(context).textTheme.bodyMedium?.merge(
            TextStyle(color: color),
          ),
    );
  }
}