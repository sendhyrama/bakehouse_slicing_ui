// lib/widgets/custom_dialog.dart
import 'package:flutter/material.dart';
import 'package:bakehouse_slicing_ui/common/colors.dart';
import 'package:bakehouse_slicing_ui/common/text_styles.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final String content;
  final VoidCallback onConfirm;
  final String confirmText;
  final bool isReject; // New parameter

  CustomDialog({
    required this.title,
    required this.content,
    required this.onConfirm,
    required this.confirmText,
    this.isReject = false, // Default value is false
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: TextStyles.h3.copyWith(color: PrimaryColor.c5),
            ),
            const SizedBox(height: 8.0),
            Text(
              content,
              style: TextStyles.b1.copyWith(color: Colors.black),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Kembali',
                      style: TextStyles.b1.copyWith(color: Colors.grey[800])),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.grey[800],
                    side: const BorderSide(color: Colors.grey),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                const SizedBox(width: 16.0),
                ElevatedButton(
                  onPressed: onConfirm,
                  child: Text(confirmText),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: isReject ? Colors.red : Colors.green, // Change background color
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
