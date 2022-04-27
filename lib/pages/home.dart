import 'dart:io';

import 'package:budget/services/database/database_service.dart';
import 'package:budget/utils/ofx_parser.dart';
import 'package:budget/widgets/transactions_for_month.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  // List<Transaction> _t = [];

  @override
  void initState() {
    super.initState();

    // Future.delayed(const Duration(milliseconds: 500)).then((_) {
    //   ref.read(transactionDatabaseProvider).getTransactions().then((value) {
    //     setState(() {
    //       _t = value;
    //     });
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: App,
      body: Row(
        children: [
          Expanded(
            child: Column(
              children: const [
                Expanded(child: TransactionsForMonth()),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                ElevatedButton(
                  child: Text("Import File"),
                  onPressed: () async {
                    final result = await FilePicker.platform.pickFiles(
                      dialogTitle: "Select bank file to import",
                      allowMultiple: false,
                      allowedExtensions: ["ofx"],
                      type: FileType.custom,
                    );
          
                    if (result != null) {
                      File ofxFile = File(result.files.single.path!);
          
                      final String fileContents = await ofxFile.readAsString();
                      // print(fileContents);
          
                      final bankStatement = OfxParser.parseOFX(fileContents);
                      // print(transactions);
          
                      await ref
                          .read(transactionDatabaseProvider)
                          .addTransactions(bankStatement.transactions);
          
                      // ref
                      //     .read(transactionDatabaseProvider)
                      //     .getTransactions()
                      //     .then((value) {
                      //   setState(() {
                      //     _t = value;
                      //   });
                      // });
                    }
                  },
                ),
                Flexible(
                  child: const Text(
                    "TODO Total income and spent this month",
                  ),
                ),
                Flexible(child: const Text("TODO 10 most recent transactions"))
              ],
            ),
          )
        ],
      ),

      //  SingleChildScrollView(
      //   child: Column(
      //     children: [
      //       ElevatedButton(
      //         child: Text("Import File"),
      //         onPressed: () async {
      //           final result = await FilePicker.platform.pickFiles(
      //               dialogTitle: "Select bank file to import",
      //               allowMultiple: false,
      //               allowedExtensions: ["ofx"],
      //               type: FileType.custom);

      //           if (result != null) {
      //             File ofxFile = File(result.files.single.path!);

      //             final String fileContents = await ofxFile.readAsString();
      //             // print(fileContents);

      //             final bankStatement = OfxParser.parseOFX(fileContents);
      //             // print(transactions);

      //             await ref
      //                 .read(transactionDatabaseProvider)
      //                 .addTransactions(bankStatement.transactions);

      //             ref
      //                 .read(transactionDatabaseProvider)
      //                 .getTransactions()
      //                 .then((value) {
      //               setState(() {
      //                 _t = value;
      //               });
      //             });
      //           }
      //         },
      //       ),
      //       ...[
      //         for (final t in _t)
      //           ListTile(
      //             title: Text(t.name),
      //             subtitle: Text(t.datePosted.toString()),
      //             trailing: Text("\$${t.amount.toStringAsFixed(2)}"),
      //           ),
      //       ]
      //     ],
      //   ),
      // ),
    );
  }
}


