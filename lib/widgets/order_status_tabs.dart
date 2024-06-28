// lib/widgets/order_status_tabs.dart
import 'package:bakehouse_slicing_ui/common/colors.dart';
import 'package:flutter/material.dart';

import '../common/text_styles.dart';

class OrderStatusTabs extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabSelected;

  OrderStatusTabs({
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
          _buildTabItem(context, 0, 'Pesanan Baru'),
          _buildTabItem(context, 1, 'Diproduksi'),
          _buildTabItem(context, 2, 'Dikemas'),
          _buildTabItem(context, 3, 'Siap diambil'),
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
