// lib/pages/inventory_page.dart
import 'package:flutter/material.dart';

class InventoryPage extends StatelessWidget {
  const InventoryPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inventaris'),
      ),
      body: const Center(
        child: Text('Inventaris Page'),
      ),
    );
  }
}
