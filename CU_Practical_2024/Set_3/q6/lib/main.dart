/* 
Develop a Flutter app that generates a payslip for a given month. 
There will be a way to provide text field for input of Basic salary 
and calculate HRA (House Rent Allowance), DA (Dearness Allowance), 
Gross Salary, IT (Income Tax) and Net Salary. Give proper title on 
the app bar. The values will be calculated as follows: 
  HRA 20% of Basic salary 
• DA= 15% of Basic salary 
  MA (Medical Allowance) = 7600 
• Gross Salary Basic + HRA + DA + MA 
. IT 5% of Basic Salary 
  Net Salary Gross - IT
*/

import 'package:flutter/material.dart';

void main() => runApp(const PayslipApp());

class PayslipApp extends StatelessWidget {
  const PayslipApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        useMaterial3: true,
      ),
      home: const PayslipGenerator(),
    );
  }
}

class PayslipGenerator extends StatefulWidget {
  const PayslipGenerator({super.key});

  @override
  State<PayslipGenerator> createState() => _PayslipGeneratorState();
}

class _PayslipGeneratorState extends State<PayslipGenerator> {
  final TextEditingController _basicSalaryController = TextEditingController();

  double _hra = 0, _da = 0, _gross = 0, _it = 0, _net = 0;
  final double _ma = 7600;

  void _calculatePayslip() {
    double basic = double.tryParse(_basicSalaryController.text) ?? 0;

    setState(() {
      _hra = basic * 0.20; // 20% HRA
      _da = basic * 0.15; // 15% DA
      _gross = basic + _hra + _da + _ma; // Basic + HRA + DA + MA
      _it = basic * 0.05; // 5% IT
      _net = _gross - _it; // Gross - IT
    });
  }

  void _clear() {
    setState(() {
      _basicSalaryController.clear();
      _hra = _da = _gross = _it = _net = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Monthly Payslip Generator'),
        backgroundColor: Colors.blueGrey.shade100,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _basicSalaryController,
              decoration: const InputDecoration(
                labelText: 'Enter Basic Salary',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.money),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: _calculatePayslip,
                    child: const Text('Generate Payslip'),
                  ),
                ),
                const SizedBox(width: 10),
                OutlinedButton(onPressed: _clear, child: const Text('Clear')),
              ],
            ),
            const SizedBox(height: 20),
            const Divider(),
            _buildResultCard(),
          ],
        ),
      ),
    );
  }

  Widget _buildResultCard() {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Salary Breakdown',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Divider(),
            _salaryRow(
              'Basic Salary',
              _basicSalaryController.text.isEmpty
                  ? "0"
                  : _basicSalaryController.text,
            ),
            _salaryRow('HRA (20%)', _hra.toStringAsFixed(2)),
            _salaryRow('DA (15%)', _da.toStringAsFixed(2)),
            _salaryRow('MA (Fixed)', _ma.toStringAsFixed(2)),
            const Divider(),
            _salaryRow('Gross Salary', _gross.toStringAsFixed(2), isBold: true),
            _salaryRow('IT (5%)', _it.toStringAsFixed(2), color: Colors.red),
            const Divider(),
            _salaryRow(
              'Net Salary',
              _net.toStringAsFixed(2),
              isBold: true,
              color: Colors.green,
            ),
          ],
        ),
      ),
    );
  }

  Widget _salaryRow(
    String label,
    String value, {
    bool isBold = false,
    Color? color,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            '₹$value',
            style: TextStyle(
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
