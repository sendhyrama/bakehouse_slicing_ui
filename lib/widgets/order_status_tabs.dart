// lib/widgets/order_status_tabs.dart
import 'package:bakehouse_slicing_ui/common/colors.dart';
import 'package:bakehouse_slicing_ui/common/text_styles.dart';
import 'package:flutter/material.dart';

class OrderStatusTabs extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabSelected;

  OrderStatusTabs({required this.selectedIndex, required this.onTabSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildTabItem('Pesanan Baru', 0),
          _buildTabItem('Diproduksi', 1),
          _buildTabItem('Dikemas', 2),
          _buildTabItem('Siap diambil', 3),
        ],
      ),
    );
  }

  Widget _buildTabItem(String title, int index) {
    bool isSelected = index == selectedIndex;
    return GestureDetector(
      onTap: () => onTabSelected(index),
      child: Column(
        children: [
          const SizedBox(height: 16.0), // Top padding
          Text(
            title,
            style: TextStyles.b1.copyWith(
              color: isSelected ? PrimaryColor.c8 : Colors.grey,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          const SizedBox(height: 8.0),
          if (isSelected)
            Container(
              height: 2.0,
              width: 100.0,
              color: PrimaryColor.c8,
            ),
        ],
      ),
    );
  }
}
