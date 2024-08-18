// lib/widgets/order_page_header.dart
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
        color: PrimaryColor.c8,
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
                      isStatusSelected ? NeutralColor.c9 : NeutralColor.c7,
                  backgroundColor:
                      isStatusSelected ? Colors.white : PrimaryColor.c3,
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
                onPressed: () => onHistoryPressed(),
                style: ElevatedButton.styleFrom(
                  foregroundColor:
                      isStatusSelected ? NeutralColor.c7 : NeutralColor.c9,
                  backgroundColor:
                      isStatusSelected ? PrimaryColor.c3 : Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text('Riwayat Pesanan', style: TextStyles.b1),
              ),
              // Uncomment the following lines if you need the filter button
              // IconButton(
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
