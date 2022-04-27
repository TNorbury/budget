import 'package:budget/models/account/account.dart';
import 'package:budget/models/bank_statement.dart';
import 'package:budget/models/transaction/transaction.dart';

class OfxParser {
  /// Parses the contents of an OFX file and returns the transactions from it
  static BankStatement parseOFX(String ofx) {
    List<Transaction> transactions = [];

    final lines = ofx.split("\n");

    bool inTransaction = false;
    DateTime? datePosted;
    double? transactionAmount;
    String? name;
    String? memo;
    String? fitId;

    // extract the one-off information that's easy to get with regex
    final int accountId =
        int.tryParse(RegExp(r'<ACCTID>(.*)').firstMatch(ofx)?.group(1) ?? "") ??
            0;
    final String bankOrg = RegExp(r'<ORG>(.*)').firstMatch(ofx)?.group(1) ?? "";

    final Account account =
        Account(bankOrg: bankOrg, accountId: accountId, nickName: "");

    // read the file, line by line
    // very brute force, but OFX isn't in a good
    for (var line in lines) {
      line = line.trim();

      if (line.isEmpty) {
        continue;
      }

      // start a statement section
      if (line.startsWith("<STMTTRN>") && !inTransaction) {
        inTransaction = true;
        datePosted = null;
        transactionAmount = null;
        name = null;
        memo = null;
      }

      // end of statement section, create a transaction
      else if (line.startsWith("</STMTTRN>") && inTransaction) {
        inTransaction = false;

        transactions.add(
          Transaction(
            name: name!,
            memo: memo!,
            amount: transactionAmount!,
            datePosted: datePosted!,
            fitId: fitId!,
          )..account.value = account,
        );
      }

      // currently in the transaction, try to parse some data
      else if (inTransaction) {
        final lineSplit = line.split(">");
        if (lineSplit.length != 2) {
          continue;
        }
        final tag = lineSplit[0].substring(1);
        final value = lineSplit[1];

        switch (tag) {
          case "DTPOSTED":
            datePosted = DateTime.parse(value.substring(0, 4) +
                "-" +
                value.substring(4, 6) +
                "-" +
                value.substring(6, 8));
            break;
          case "TRNAMT":
            transactionAmount = double.parse(value);
            break;
          case "NAME":
            name = value;
            break;
          case "MEMO":
            memo = value;
            break;
          case "FITID":
            fitId = value;
            break;
        }
      }
    }

    return BankStatement(account: account, transactions: transactions);
  }
}
