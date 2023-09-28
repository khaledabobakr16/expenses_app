import 'package:expenses_app/presentation/widgets/expanses_list/expanses_item.dart';
import 'package:flutter/material.dart';

import '../../../data/models/expense.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenses,
    required this.onRemoveExpense,
  });
  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) => Dismissible(
        key: ValueKey(expenses[index]),
        background: Container(
          color: Theme.of(context).colorScheme.error.withOpacity(0.5),
          margin: Theme.of(context).cardTheme.margin,
        ),
        onDismissed: (direcrion) => onRemoveExpense(expenses[index]),
        child: ExpensesItem(
          expense: expenses[index],
        ),
      ),
    );
  }
}
