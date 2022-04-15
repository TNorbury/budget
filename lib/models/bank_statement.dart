import 'package:budget/models/account/account.dart';
import 'package:budget/models/transaction/transaction.dart';

/// A bank statement is a collection of transactions for a specific account
class BankStatement {

  final Account account;
  
  /// All the transactions in this statement
  final List<Transaction> transactions;
  
  BankStatement({
    required this.account,
    required this.transactions,
  });

}
