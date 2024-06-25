// lib/widgets/order_page_top_section.dart
import 'package:bakehouse_slicing_ui/common/colors.dart';
import 'package:bakehouse_slicing_ui/common/text_styles.dart';
import 'package:flutter/material.dart';

class OrderPageHeader extends StatelessWidget {
  final Function onStatusPressed;
  final Function onHistoryPressed;
  final Function onFilterPressed;
  final bool isStatusSelected;

  OrderPageHeader({
    required this.onStatusPressed,
    required this.onHistoryPressed,
    required this.onFilterPressed,
    this.isStatusSelected = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        color: PrimaryColor.c5, // Adjust the color as needed
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 24.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Pesanan',
                style: TextStyles.h1.copyWith(color: Colors.white),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => onStatusPressed(),
                style: ElevatedButton.styleFrom(
                  foregroundColor:
                      isStatusSelected ? Colors.white : PrimaryColor.c8,
                  backgroundColor:
                      isStatusSelected ? PrimaryColor.c8 : Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  'Status Pesanan',
                  style: TextStyles.b1,
                ),
              ),
              const SizedBox(width: 12.0),
              ElevatedButton(
                onPressed: () {
                  onHistoryPressed();
                  Navigator.of(context).pushNamed('/order-history');
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor:
                      isStatusSelected ? PrimaryColor.c8 : Colors.white,
                  backgroundColor:
                      isStatusSelected ? Colors.white : PrimaryColor.c8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text('Riwayat Pesanan', style: TextStyles.b1),
              ),
              // IcddonButton(
              //   icon: const Icon(Icons.filter_list, color: Colors.white),
              //   onPressed: () => onFilterPressed(),
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
