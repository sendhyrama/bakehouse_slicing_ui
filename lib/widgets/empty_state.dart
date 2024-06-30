// lib/widgets/empty_state.dart
import 'package:bakehouse_slicing_ui/common/text_styles.dart';
import 'package:flutter/material.dart';

class EmptyState extends StatelessWidget {
  final String message;
  final IconData icon;

  EmptyState({required this.message, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 80.0, color: Colors.grey),
          const SizedBox(height: 16.0),
          Text(
            message,
            style: TextStyles.h3,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
