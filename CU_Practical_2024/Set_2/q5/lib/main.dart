/*
Develop a Flutter expense tracker app using Dart programming that calculate expense 
by user-given dates. Display a summary of expenses by category and date. 
*/

import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Corrected import

void main() => runApp(const ExpenseTrackerApp());

class ExpenseTrackerApp extends StatelessWidget {
  const ExpenseTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const ExpenseScreen(),
    );
  }
}

// Data Model
class Expense {
  final String category;
  final double amount;
  final DateTime date;

  Expense({required this.category, required this.amount, required this.date});
}

class ExpenseScreen extends StatefulWidget {
  const ExpenseScreen({super.key});

  @override
  State<ExpenseScreen> createState() => _ExpenseScreenState();
}

class _ExpenseScreenState extends State<ExpenseScreen> {
  final List<Expense> _allExpenses = [];
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  String _selectedCategory = 'Food';

  // --- LOGIC: Calculate Summary by Category ---
  Map<String, double> get categorySummary {
    Map<String, double> summary = {};
    for (var exp in _allExpenses) {
      summary.update(
        exp.category,
        (value) => value + exp.amount,
        ifAbsent: () => exp.amount,
      );
    }
    return summary;
  }

  void _presentDatePicker() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime.now(),
    );
    if (picked != null) setState(() => _selectedDate = picked);
  }

  void _addExpense() {
    final amt = double.tryParse(_amountController.text) ?? 0;
    if (amt <= 0 || _selectedDate == null) return;

    setState(() {
      _allExpenses.add(
        Expense(category: _selectedCategory, amount: amt, date: _selectedDate!),
      );
    });
    _amountController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Expense Summary'), centerTitle: true),
      body: Column(
        children: [
          // 1. INPUT SECTION
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    TextField(
                      controller: _amountController,
                      decoration: const InputDecoration(labelText: 'Amount'),
                      keyboardType: TextInputType.number,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            _selectedDate == null
                                ? 'No Date'
                                : DateFormat.yMd().format(_selectedDate!),
                          ),
                        ),
                        TextButton(
                          onPressed: _presentDatePicker,
                          child: const Text('Pick Date'),
                        ),
                      ],
                    ),
                    DropdownButton<String>(
                      value: _selectedCategory,
                      isExpanded: true,
                      items: ['Food', 'Transport', 'Rent', 'Shopping']
                          .map(
                            (cat) =>
                                DropdownMenuItem(value: cat, child: Text(cat)),
                          )
                          .toList(),
                      onChanged: (val) =>
                          setState(() => _selectedCategory = val!),
                    ),
                    ElevatedButton(
                      onPressed: _addExpense,
                      child: const Text('Add Expense'),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // 2. SUMMARY SECTION (Calculated by Category)
          const Text(
            "Summary by Category",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(
            height: 80,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: categorySummary.entries.map((entry) {
                return Card(
                  color: Colors.blue.shade50,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 5,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Text(
                          entry.key,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text("\$${entry.value.toStringAsFixed(2)}"),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),

          // 3. HISTORY SECTION
          const Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: _allExpenses.length,
              itemBuilder: (ctx, i) => ListTile(
                title: Text(_allExpenses[i].category),
                subtitle: Text(DateFormat.yMMMd().format(_allExpenses[i].date)),
                trailing: Text("\$${_allExpenses[i].amount}"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
