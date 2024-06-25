// lib/widgets/order_history_tabs.dart
import 'package:flutter/material.dart';

class OrderHistoryTabs extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabSelected;

  OrderHistoryTabs({
    required this.selectedIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildTabItem(context, 0, 'Selesai'),
          _buildTabItem(context, 1, 'Dibatalkan'),
          _buildTabItem(context, 2, 'Ditolak'),
        ],
      ),
    );
  }

  Widget _buildTabItem(BuildContext context, int index, String text) {
    bool isSelected = index == selectedIndex;
    return GestureDetector(
      onTap: () => onTabSelected(index),
      child: Column(
        children: [
          Text(
            text,
            style: TextStyle(
              color: isSelected ? Colors.blue : Colors.grey,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          if (isSelected)
            Container(
              margin: const EdgeInsets.only(top: 8.0),
              height: 2.0,
              width: 60.0,
              color: Colors.blue,
            ),
        ],
      ),
    );
  }
}
