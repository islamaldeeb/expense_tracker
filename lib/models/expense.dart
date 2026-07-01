import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

const uuid = Uuid();
final dateFormat = DateFormat.yMd();

enum Category { food, travel, leisure, word }

const categoryIcon = {
  Category.food: Icons.lunch_dining,
  Category.travel:Icons.flight_takeoff,
  Category.leisure: Icons.movie,
  Category.word: Icons.work,
};

class Expense {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formattedDate {
    return dateFormat.format(date);
  }

  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();
}
