import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../data/models/expense.dart';

class FormNewExpense extends StatefulWidget {
  const FormNewExpense({super.key, required this.onAddExpense});
  final void Function(Expense expense) onAddExpense;

  @override
  State<FormNewExpense> createState() => _FormNewExpenseState();
}

class _FormNewExpenseState extends State<FormNewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  final formatter = DateFormat().add_yMd();
  DateTime? selectedDataTime;
  Category selectedCategory = Category.travel;
  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _amountController.dispose();
  }

  void _saveExpense() {
    setState(() {
      final enteredAmount = double.tryParse(_amountController.text);
      final bool amountInvalid = enteredAmount == null || enteredAmount <= 0;
      if (_titleController.text.trim().isEmpty ||
          amountInvalid ||
          selectedDataTime == null) {
        log('error');
        showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
                  title: const Text('Error'),
                  content: const Text(
                      'Please make surea vaild title, amount, date and category was entered.'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(ctx);
                      },
                      child: const Text("ok"),
                    )
                  ],
                ));
      } else {
        widget.onAddExpense(Expense(
          title: _titleController.text,
          amount: enteredAmount,
          date: selectedDataTime!,
          category: selectedCategory,
        ));
        Navigator.pop(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            maxLength: 50,
            controller: _titleController,
            decoration: const InputDecoration(
              label: Text('Title'),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.number,
                  maxLength: 50,
                  controller: _amountController,
                  decoration: const InputDecoration(
                    label: Text('Amount'),
                    prefixText: '\$',
                  ),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      selectedDataTime == null
                          ? "Select Date"
                          : formatter.format(selectedDataTime!),
                    ),
                    IconButton(
                      onPressed: () async {
                        final now = DateTime.now();
                        final firstDate =
                            DateTime(now.year - 2, now.month, now.day);
                        final lastDate =
                            DateTime(now.year + 2, now.month, now.day);
                        final DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: now,
                          firstDate: firstDate,
                          lastDate: lastDate,
                        );
                        setState(() {
                          selectedDataTime = pickedDate;
                          log(selectedDataTime!.toString());
                        });
                      },
                      icon: const Icon(Icons.calendar_month),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              DropdownButton(
                value: selectedCategory,
                items: Category.values
                    .map(
                      (e) => DropdownMenuItem(
                        value: e,
                        child: Text(e.name),
                      ),
                    )
                    .toList(),
                onChanged: (newCategory) {
                  if (newCategory == null) {
                    return;
                  }
                  setState(() {
                    selectedCategory = newCategory;
                  });
                },
              ),
              const Spacer(),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: _saveExpense,
                child: const Text("Save Expense"),
              )
            ],
          ),
        ],
      ),
    );
  }
}
