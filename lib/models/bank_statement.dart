import 'package:budget/models/transaction/transaction.dart';

/// A bank statement is a collection of transactions for a specific account
class BankStatement {

  /// Name of the bank or organization
  final String bankOrg;

  /// Id of the account
  final String accountId;
  
  /// All the transactions in this statement
  final List<Transaction> transactions;
  
  BankStatement({
    required this.bankOrg,
    required this.accountId,
    required this.transactions,
  });

}
