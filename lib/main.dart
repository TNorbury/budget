import 'package:budget/pages/home.dart';
import 'package:budget/services/database/database_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  // Run the app and pass in the SettingsController. The app listens to the
  // SettingsController for changes, then passes it further down to the
  // SettingsView.
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ref) {
    ref.watch(databaseServiceProvider);
    return MaterialApp(
      title: 'Material App',
      home: const HomePage(),
    );
  }
}