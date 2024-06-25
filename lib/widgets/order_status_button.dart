// lib/widgets/order_status_button.dart
import 'package:flutter/material.dart';

class OrderStatusButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  OrderStatusButton({required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: label == 'Chat Pembeli' ? Colors.green : Colors.blue,
      ),
    );
  }
}
