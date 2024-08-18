// lib/widgets/filter_indicator.dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../common/colors.dart';
import '../common/text_styles.dart';
import 'filter_bottom_sheet.dart';

class FilterIndicator extends StatelessWidget {
  final DateTime? startDate;
  final DateTime? endDate;
  final VoidCallback onClearFilter;

  FilterIndicator({
    required this.startDate,
    required this.endDate,
    required this.onClearFilter,
  });

  final DateFormat _dateFormat = DateFormat('dd/MM/yyyy');

  @override
  Widget build(BuildContext context) {
    if (startDate == null || endDate == null) {
      return const SizedBox.shrink();
    }

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Mulai Tanggal', style: TextStyles.b1),
                const SizedBox(height: 4.0),
                GestureDetector(
                  onTap: () async {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                      ),
                      builder: (context) {
                        return FilterBottomSheet(
                          onApplyFilter: (start, end) {
                            // Update the filter state
                          },
                          initialStartDate: startDate,
                          initialEndDate: endDate,
                        );
                      },
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          startDate == null ? 'Pilih' : _dateFormat.format(startDate!),
                          style: TextStyle(color: startDate == null ? Colors.grey : Colors.black),
                        ),
                        Icon(Icons.calendar_today, color: startDate == null ? Colors.grey : SecondaryColor.c8),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Sampai Tanggal', style: TextStyles.b1),
                const SizedBox(height: 4.0),
                GestureDetector(
                  onTap: () async {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                      ),
                      builder: (context) {
                        return FilterBottomSheet(
                          onApplyFilter: (start, end) {
                            // Update the filter state
                          },
                          initialStartDate: startDate,
                          initialEndDate: endDate,
                        );
                      },
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          endDate == null ? 'Pilih' : _dateFormat.format(endDate!),
                          style: TextStyle(color: endDate == null ? Colors.grey : Colors.black),
                        ),
                        Icon(Icons.calendar_today, color: endDate == null ? Colors.grey : SecondaryColor.c8),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.highlight_remove, color: Colors.red),
            onPressed: onClearFilter,
          ),
        ],
      ),
    );
  }
}
