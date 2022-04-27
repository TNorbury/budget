import 'dart:math';
import 'dart:ui';

import 'package:budget/models/transaction/transaction.dart';
import 'package:isar/isar.dart';

part "category.g.dart";

@Collection(accessor: "categories")
class Category {
  @Id()
  final int id = Isar.autoIncrement;

  /// The name of the category
  final String name;

  /// Total amount you can spend on this category per month
  final double monthlyLimit;

  final Color color;

  final transactions = IsarLinks<Transaction>();

  Category({
    required this.name,
    required this.monthlyLimit,
    Color? color,
  }) : color = color ??
            Color.fromARGB(
              255,
              Random().nextInt(256),
              Random().nextInt(256),
              Random().nextInt(256),
            );
}
