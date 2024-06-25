// lib/widgets/update_status_dialog.dart
import 'package:bakehouse_slicing_ui/common/colors.dart';
import 'package:bakehouse_slicing_ui/common/text_styles.dart';
import 'package:flutter/material.dart';

class UpdateStatusDialog extends StatelessWidget {
  final VoidCallback onConfirm;
  final String currentStatus;

  UpdateStatusDialog({required this.onConfirm, required this.currentStatus});

  String getNextStatusText(String status) {
    switch (status) {
      case 'Pesanan Baru':
        return 'Siap Produksi';
      case 'Diproduksi':
        return 'Siap Dikemas';
      case 'Dikemas':
        return 'Siap Diambil';
      default:
        return 'Siap Produksi';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Perbarui status',
              style: TextStyles.h3.copyWith(color: PrimaryColor.c5)
            ),
            const SizedBox(height: 8.0),
            const Text(
              'Apakah Anda Yakin?',
              style: TextStyle(color: Colors.black),
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Kembali', style: TextStyles.b1.copyWith(color: Colors.grey[800])),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.grey[800], side: const BorderSide(color: Colors.grey),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: onConfirm,
                  child: Text(getNextStatusText(currentStatus)),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
