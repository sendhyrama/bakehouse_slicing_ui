// lib/widgets/order_history_tabs.dart
import 'package:bakehouse_slicing_ui/common/colors.dart';
import 'package:flutter/material.dart';

import '../common/text_styles.dart';

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
          const SizedBox(height: 8.0),
          Text(
            text,
            style: TextStyles.b1.copyWith(
              color: isSelected ? PrimaryColor.c8 : Colors.grey,
              fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
            ),
          ),
          if (isSelected)
            Container(
              margin: const EdgeInsets.only(top: 8.0),
              height: 2.0,
              width: 100.0,
              color: PrimaryColor.c8,
            ),
        ],
      ),
    );
  }
}
