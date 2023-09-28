import 'package:flutter/material.dart';

import '../../data/models/expense.dart';
import '../widgets/chart/chart.dart';
import '../widgets/expanses_list/expanses_list.dart';
import '../widgets/expanses_list/form_new_expense.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: "Flutter Course",
      amount: 29.9,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: "Cinema",
      amount: 89.9,
      date: DateTime.now(),
      category: Category.lesiure,
    ),
    Expense(
      title: "Breakfast",
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

  void _removeExpense(Expense expense) {
    setState(() {
      _registeredExpenses.remove(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const Center(child: Text("Expense Tracker")),
        actions: [
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (ctx) => FormNewExpense(
                          onAddExpense: _addExpense,
                        ));
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Chart(
              expenses: _registeredExpenses,
            ),
            Expanded(
              child: ExpensesList(
                  onRemoveExpense: _removeExpense,
                  expenses: _registeredExpenses),
            )
          ],
        ),
      ),
    );
  }
}
