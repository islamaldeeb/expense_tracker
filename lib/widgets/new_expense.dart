// ignore_for_file: unused_field

import 'dart:developer';

import 'package:flutter/material.dart';
import '../models/expense.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});

  final void Function(Expense expense) onAddExpense;

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  DateTime? _selectedDate;
  Category _selectedCategory = Category.travel;

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _amountController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: InputDecoration(label: Text('Title')),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    label: Text('Amount'),
                    prefixText: '\$',
                  ),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('Select Date'),
                    IconButton(
                      onPressed: () async {
                        final now = DateTime.now();
                        final firstDate = DateTime(
                          now.year - 1,
                          now.month,
                          now.day,
                        );
                        final DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: now,
                          firstDate: firstDate,
                          lastDate: now,
                        );
                        setState(() {
                          _selectedDate = pickedDate;
                        });
                      },
                      icon: Icon(Icons.calendar_month),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              DropdownButton(
                items: Category.values
                    .map(
                      (e) => DropdownMenuItem(
                        value: e,
                        child: Text(e.name.toUpperCase()),
                      ),
                    )
                    .toList(),
                onChanged: (newCat) {
                  if (newCat == null) {
                    return;
                  }
                  setState(() {
                    _selectedCategory = newCat;
                  });
                },
              ),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  log(_titleController.text);
                  log(_amountController.text);
                },
              
                child: Text('Save Expense'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
