// lib/widgets/filter_bottom_sheet.dart
import 'package:bakehouse_slicing_ui/common/colors.dart';
import 'package:bakehouse_slicing_ui/common/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FilterBottomSheet extends StatefulWidget {
  final Function(DateTime, DateTime) onApplyFilter;
  final DateTime? initialStartDate;
  final DateTime? initialEndDate;

  FilterBottomSheet({
    required this.onApplyFilter,
    this.initialStartDate,
    this.initialEndDate,
  });

  @override
  _FilterBottomSheetState createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  DateTime? startDate;
  DateTime? endDate;

  @override
  void initState() {
    super.initState();
    startDate = widget.initialStartDate;
    endDate = widget.initialEndDate;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 4.0,
            width: 40.0,
            color: Colors.grey[300],
            margin: const EdgeInsets.only(bottom: 16.0),
          ),
          const Row(
            children: [
              Text('Sortir', style: TextStyles.h3),
            ],
          ),
          const SizedBox(height: 16.0),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Mulai Tanggal', style: TextStyles.b1),
                    const SizedBox(height: 8.0),
                    GestureDetector(
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: startDate ?? DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2101),
                        );
                        if (pickedDate != null) {
                          setState(() {
                            startDate = pickedDate;
                          });
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12.0, horizontal: 16.0),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              startDate == null
                                  ? 'Pilih'
                                  : DateFormat('dd/MM/yyyy').format(startDate!),
                              style: TextStyle(
                                  color: startDate == null
                                      ? Colors.grey
                                      : Colors.black),
                            ),
                            Icon(Icons.calendar_today,
                                color: startDate == null
                                    ? Colors.grey
                                    : SecondaryColor.c8),
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
                    const Text('Sampai Tanggal',
                        style: TextStyle(fontSize: 14.0)),
                    const SizedBox(height: 8.0),
                    GestureDetector(
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: endDate ?? DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2101),
                        );
                        if (pickedDate != null) {
                          setState(() {
                            endDate = pickedDate;
                          });
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12.0, horizontal: 16.0),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              endDate == null
                                  ? 'Pilih'
                                  : DateFormat('dd/MM/yyyy').format(endDate!),
                              style: TextStyle(
                                  color: endDate == null
                                      ? Colors.grey
                                      : Colors.black),
                            ),
                            Icon(Icons.calendar_today,
                                color: endDate == null
                                    ? Colors.grey
                                    : SecondaryColor.c8),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Atur Ulang',
                    style: TextStyles.b1.copyWith(color: NeutralColor.c6)),
              ),
              const SizedBox(
                width: 16.0,
              ),
              ElevatedButton(
                onPressed: () {
                  if (startDate != null && endDate != null) {
                    widget.onApplyFilter(startDate!, endDate!);
                  }
                  Navigator.of(context).pop();
                },
                child: const Text('Simpan', style: TextStyles.b1),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: SuccessColor.c5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
