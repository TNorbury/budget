
import 'package:budget/models/transaction/transaction.dart';
import 'package:flutter/material.dart';

class TransactionTile extends StatelessWidget {
  final Transaction transaction;
  const TransactionTile({
    Key? key,
    required this.transaction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DateTime datePosted = transaction.datePosted;
    return Container(
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
              Text(
                transaction.account.value?.bankOrg ?? "",
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          )
        ],
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