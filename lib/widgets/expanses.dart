import 'package:app03/models/expense.dart';
import 'package:flutter/material.dart';

import 'expanses_list/expanses_list.dart';
import 'new_expense.dart';

class Expanses extends StatefulWidget {
  const Expanses({super.key});

  @override
  State<Expanses> createState() => _ExpansesState();
}

class _ExpansesState extends State<Expanses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Flutter',
      amount: 29,
      date: DateTime.now(),
      category: Category.word,
    ),
    Expense(
      title: 'Cinema',
      amount: 9.71,
      date: DateTime.now(),
      category: Category.leisure,
    ),
    Expense(
      title: 'Breakfast',
      amount: 31.3,
      date: DateTime.now(),
      category: Category.food,
    ),
  ];

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Flutter')),
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (ctx) => NewExpense(onAddExpense: _addExpense),
              );
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('....'),
            Expanded(child: ExpensesList(expenses: _registeredExpenses)),
          ],
        ),
      ),
    );
  }
}
