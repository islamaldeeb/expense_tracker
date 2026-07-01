import 'package:app03/models/expense.dart';
import 'package:flutter/material.dart';

class ExpansesItem extends StatelessWidget {
  const ExpansesItem( {super.key, required this.expense});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Text(expense.title),
            SizedBox(height: 4,),
            Row(
              children: [
                Text(
                  '\$${expense.amount.toStringAsFixed(2)}'
                ),
                Spacer(),
                Row(
                  children: [
                    Icon(categoryIcon[expense.category]),
                    SizedBox(width: 4,),
                    Text(expense.formattedDate),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
