// lib/pages/finance_page.dart
import 'package:flutter/material.dart';

class FinancePage extends StatelessWidget {
  const FinancePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Keuangan'),
      ),
      body: const Center(
        child: Text('Keuangan Page'),
      ),
    );
  }
}
